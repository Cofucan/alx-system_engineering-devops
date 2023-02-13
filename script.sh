#!/bin/bash
mkdir 0x02-shell_redirections
cd 0x02-shell_redirections/
echo "# Shell Redirections Readme" > README.md

declare -a files

files[0]="0-hello-world"
files[1]="1-confused_smiley"
files[2]="2-hellofile"
files[3]="3-twofiles"
files[4]="4-lastlines"
files[5]="5-firstlines"
files[6]="6-third_line"
files[7]="7-file"
files[8]="8-cwd_state"
files[9]="9-duplicate_last_line"
files[10]="10-no_more_js"
files[11]="11-directories"
files[12]="12-newest_files"
files[13]="13-unique"
files[14]="14-findthatword"
files[15]="15-countthatword"
files[16]="16-whatsnext"
files[17]="17-hidethisword"
files[18]="18-letteronly"
files[19]="19-AZ"
files[20]="20-hiago"
files[21]="21-reverse"
files[22]="22-users_and_homes"

for i in "${files[@]}"
do
	echo "#!/bin/bash" >> "$i"
	chmod +x "$i"
done

