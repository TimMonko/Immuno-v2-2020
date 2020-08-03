///
run("Slice Remover", "first=4 last=9 increment=1");
run("Stack to Images");

Object 	= newArray(	"Ch2",
					"Ch1",
					"Ch2",
					"Ch3",
					"Ch3",
					"Ch3"
					);
Selector= newArray(	"Ch1", 
					"Ch3",
					"Ch3",
					"Ch1",
					"Ch2",
					"Ch2_On_Ch1"
					);
Overlap = 35


for (i = 0; i<Object.length; i++) {
	selectWindow(Object[i]);
	run("Duplicate...", " "); 
	rename("Object");
	selectWindow(Selector[i]);
	run("Duplicate...", " "); 
	rename("Selector");
	run("Binary Feature Extractor", "objects=Object selector=Selector object_overlap=Overlap");
	rename(Object[i] + "_On_" + Selector[i]);
	close("Object");
	close("Selector");
}

run("Images to Stack");
