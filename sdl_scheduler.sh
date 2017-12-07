#!/bin/bash
#This scheduler will check if file exist before running the process and rename the file after.
#defining Associative Array FilesMap
declare -A FilesMap
# defining Process name with process CSV file in FilesMap Array.
FilesMap['process-name']='/path/of/csv/file-without-file-format'
FilesMap['process-name']='/path/of/csv/file-without-file-format'
FilesMap['process-name']='/path/of/csv/file-without-file-format'
#add more if you've more processes.

#iteration over FilesMap
for i in "${!FilesMap[@]}"
do
	#checking if file exist
	if [ -f "${FilesMap[$i]}.csv" ]
	then
		#Execute the batch and rename and append date on the file
		{/home/rails/bin/process.sh $i && mv ${FilesMap[$i]} ${FilesMap[$i]}_$(date +%d-%m-%Y).csv}
	else
		#Show error message
		echo "${FilesMap[$i]}.csv Not found, Not executing batch $i process."
	fi
done
