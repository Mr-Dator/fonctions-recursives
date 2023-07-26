#load "graphics.cma";;(*Librairie pour la fenêtre Graphique*)
open Graphics;;
let d = 950 in
open_graph(" " ^ string_of_int d ^"x" ^ string_of_int d);
moveto 0 (d/2);

let dessineBranche l theta = 
	let y = int_of_float (float_of_int l*.sin theta) in
	let x = int_of_float (float_of_int l*.cos theta) in
	x,y in
	
let rec dessineArbre l theta a b dtheta = 
	if l = 0 then ()
	else begin
	let x,y = dessineBranche l theta in
	moveto a b;
	rlineto x y;
	moveto a b;
	dessineArbre (45*l/100) (theta +. dtheta)  (a+x) (b+y) dtheta;
	let xbis,ybis = dessineBranche l (-.theta) in
	moveto a b;
	rlineto xbis ybis;
	dessineArbre (45*l/100) (theta +. dtheta)  (a+xbis) (b+ybis) dtheta; end in 
	
dessineArbre 450 (Float.pi /.5.) (0) (d/2) (Float.pi/. 20.);;


(*let rec f = 0::1::f;;
let rec printliste f n = match n,f with 
	0,_ -> ()
	|_,a::p -> print_int a; printliste p (n-1);;
	
printliste f 10000000;;*)
