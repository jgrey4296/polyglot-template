// //  Counter.java -*- mode: Java//l -*-
// CArtAgO artifact code for project console_example

package artifacts;

import cartago.*;

public class Counter extends Artifact {
	void init(int initialValue) {
		System.out.println("Initialising Java Counter");
		defineObsProperty("count", initialValue);
	}

	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}
