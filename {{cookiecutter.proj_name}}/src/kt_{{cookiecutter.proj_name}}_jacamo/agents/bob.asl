// Agent bob in project simple
{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true
    <- .print("Starting.");
        // get current date & time
       .date(Y,M,D); .time(H,Min,Sec,MilSec); 
       // add a new belief
       +started(Y,M,D,H,Min,Sec).             

+greeting(M)[source(A)]
    <- .print("I received ", M, " from ", A).


