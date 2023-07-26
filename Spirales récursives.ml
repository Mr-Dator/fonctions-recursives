#load "graphics.cma";;(*Librairie pour la fenêtre Graphique*)
open Graphics;;
let d = 750 in
open_graph(" " ^ string_of_int d ^"x" ^ string_of_int d);
moveto 0 (d/2);

let dessineCourbe l theta = 
	let y = int_of_float (float_of_int l*.sin theta) in
	let x = int_of_float (float_of_int l*.cos theta) in
	x,y in
	
let rec dessineArbre l theta a b dtheta = 
	if l = 0 then ()
	else begin
	let x,y = dessineCourbe l theta in
	moveto a b;
	rlineto x y;
	moveto a b;
	dessineArbre (95*l/100) (theta +. dtheta)  (a+x) (b+y) dtheta;
	end in 
	
dessineArbre 170 (0.3) (d/3) (0) (Float.pi/.8.5);;