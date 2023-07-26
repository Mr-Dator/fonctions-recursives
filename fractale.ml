#load "graphics.cma";;
open Graphics;;

let d = 2 in
let rec fractale x y r = 
	draw_circle x y r;
	if r > 1 then begin
	(*fractale (x + r/d) y (r/d);*)
	fractale (x - r/d) y (r/d);
	fractale x (y - r/d) (r/d); 
	fractale x (y + r/2) (r/2);
	end
	in
	let t = 400 in 
	open_graph (string_of_int (t*2) ^ "x" ^ string_of_int (t*2));
	set_line_width 1;
	fractale t t t;;
