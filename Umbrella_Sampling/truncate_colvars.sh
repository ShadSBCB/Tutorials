###############################################################################
#									      #	
#	Truncates COLVAR files for WHAM.				      #
#	It removes the header ('grep -v \#') and prints the first	      #
#	and second columns to a file with the same name as the COLVAR file    #
#	but with the expression '_trunc' at the end of it		      #
#									      #
#	Note that this file used the COLVAR files generated during	      #
#	the gromacs run, not the ones generated afterwards.		      #
#									      #
#	Just replace 'COLVAR*' with 'ALLCOLVAR*				      #
#									      #
#	The 'trunc' stands for 'truncated'.				      #
#									      #
#	Script created by Naushad AL Velgy.				      #
#	Any queries, email naushad.velgy@dtc.ox.ac.uk			      #
#									      #
###############################################################################

for cv in $(ls -tr COLVAR* | sort -n -t _ -k 2)

do

cat $cv | grep -v \# | awk '{printf $1"\t"$2"\n"}' > ${cv}_trunc

done
