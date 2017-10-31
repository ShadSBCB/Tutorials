###############################################################################
#									      #	
#	Post processing of trajectories					      #
#	This step is almost entirely irrelevant for analysis		      #
#	It has been left here as an educational tool			      #
#									      #
#	Note that the AT values and the KAPPA values must match the	      #
#	previously created umbrellas.					      #
#								      	      #
#	Script created by Naushad AL Velgy.				      #
#	Any queries, email naushad.velgy@dtc.ox.ac.uk			      #
#									      #
###############################################################################

for AT in $(seq -3 1 3)
do

cat >plumed.dat << EOF
phi: TORSION ATOMS=5,7,9,15
psi: TORSION ATOMS=7,9,15,17
restraint-phi: RESTRAINT ARG=phi KAPPA=100.0 AT=$AT

# monitor the two variables and the bias potential from the two restraints
PRINT STRIDE=10 ARG=phi,psi,restraint-phi.bias FILE=ALLCOLVAR_$AT
EOF

plumed driver --mf_xtc alltraj.xtc --plumed plumed.dat

done
