import os
import sys
import yara
import re
import difflib
import shutil
from colorama import *
from pyfiglet import Figlet

script_path = ''
columns = shutil.get_terminal_size().columns

# yara 检测函数
def yara_scan(script_path):
	
	family_name = ''
	file_path = {}
	index = 0

	# 遍历目录下的 yara 规则文件
	for rule_name in os.listdir('rule_db'):
		index += 1
		rule_path = os.path.join('rule_db', rule_name)
		file_path[str(index)] = rule_path

	# yara 规则匹配
	fp = open(script_path, 'rb')
	yararule = yara.compile(filepaths=file_path)
	matches = yararule.match(data=fp.read())
	fp.close()
	if len(matches) > 0:
		for match in matches:
			# 筛选出病毒家族名
			family_name += re.findall(r"linux_.+_(.+)_.+_.+", str(match))[0]

	# 返回检测出的病毒家族名
	return family_name


# 相似性计算函数
def check_similarity(family_name):

	similar_sample_path = ''
	score = 0

	sample_paths = []
	# 遍历样本库里的样本
	family_folder = 'script_db/' + family_name
	for path, dirs, filelist in os.walk(family_folder):
		for filename in filelist:
			sample_paths.append(os.path.join(path, filename))

	# 读取脚本的内容，及样本的内容
	script_content = open(script_path, encoding='utf8', errors='ignore').read().splitlines()
	with open(script_path, 'r', encoding='utf8', errors='ignore') as script_fp:
		script_content = script_fp.read().splitlines()
		script_fp.close()
	for sample_path in sample_paths:
		with open(sample_path, 'r', encoding='utf8', errors='ignore') as sample_fp:
			sample_content = sample_fp.read().splitlines()
			sample_fp.close()
		# 使用 diff 库计算脚本之间的相似度
		similarity = difflib.SequenceMatcher(None, script_content, sample_content).ratio()*100
		print("[+] vs " + sample_path + "--> " + Style.BRIGHT + Fore.RED + "%.1f%%\n" % similarity)
		# 筛选出相似度最高的样本
		if similarity > score:
			score = similarity
			similar_sample_path = sample_path

	return similar_sample_path, score


# 更新代码提取函数
def parse_modification(similar_sample_path, score):
	
	add_count = 0
	change_count = 0

	# 与相似度最高的样本进行代码改动比较
	print("[+] compare with the similar sample --> %s --> %.1f%%\n" % (Style.BRIGHT + Fore.RED + similar_sample_path, score))
	
	# 读取脚本内容，及相似样本的内容
	with open(script_path, 'r', encoding='utf8', errors='ignore') as script_fp:
		script_content = script_fp.read().splitlines()
		script_fp.close()
	with open(similar_sample_path, 'r', encoding='utf8', errors='ignore') as similar_sample_fp:
		similar_sample_content = similar_sample_fp.read().splitlines()
		similar_sample_fp.close()

	# 将代码比较结果写入 html 文件
	html_result = difflib.HtmlDiff().make_file(script_content, similar_sample_content)
	with open('compare.html', 'w', encoding='utf8', errors='ignore') as result_file:
		result_file.write(html_result)
		print("[+] create html success --> " + Style.BRIGHT + Fore.RED + "\'compare.html\'\n")
		result_file.close()

	# 统计新增的代码行数，及改动的代码行数
	text_result = difflib.context_diff(similar_sample_content, script_content)
	diffs = list(text_result)
	for diff in diffs:
		if len(diff) > 0:
			if diff[0] == '+':
				add_count += 1
			if diff[0] == '!':
				change_count += 1

	print("[+] added line --> " + Style.BRIGHT + Fore.RED + str(add_count) + "\n")
	print("[+] changed line --> " + Style.BRIGHT + Fore.RED + str(change_count/2)[:-2] + "\n")


# 主函数
if __name__ == '__main__':

	# 初始化输出
	init(autoreset=True)
	print("\n")
	print("=" * columns)
	f = Figlet(justify='center', width=columns)
	print(f.renderText('Script Ganker'))
	print("=" * columns)
	
	# 判断参数
	if len(sys.argv) < 2:
		print(Style.BRIGHT + Fore.RED + "[-] usage : killer_gen.py [script_path]")
		exit(-1)

	# 判断待检测脚本是否存在
	if os.path.isfile(sys.argv[1]):
		script_path = sys.argv[1]
	else:
		print(Style.BRIGHT + Fore.RED + "[-] [script_path] not found")
		exit(-1)

	# yara检测脚本所属的恶意软件家族
	family_name = yara_scan(script_path)
	if family_name != '':
		print("[+] malware family --> " + Style.BRIGHT + Fore.RED + family_name + "\n")
	else:
		print("[+] not found malware family\n")
	
	# 检测脚本与已知恶意样本的相似度
	similar_sample_path, score = check_similarity(family_name)

	if score > 20:
		# 提取脚本中更新的恶意代码
		parse_modification(similar_sample_path, score)
		# 打开 html 文件
		html_path = os.getcwd() + "\\compare.html"
		os.system(html_path)
	else:
		print("[+] not found similar sample\n")
