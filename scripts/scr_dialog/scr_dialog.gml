function CreateDialog () constructor {

}

function DrawDialog () constructor {
	wGUI = display_get_gui_width();
	hGUI = display_get_gui_height();
	
	static DialogBox = function () {
		draw_rectangle_color (
			0,
			hGUI,
			wGUI,
			hGUI - 200,
			c_black, c_black, c_black, c_black,
			false
		);
		
		draw_rectangle_color (
			wGUI - 20,
			hGUI - 20,
			wGUI - 80,
			hGUI - 40,
			#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF,
			false
		);
		
		new DrawGUI()
			.Text(obj_dialog.objectTarget.dialog.Messages[obj_dialog.indexMessage].Message, 20, hGUI - 170, 1, 1, ft_default,, true, c_black);
	}
	static DialogOptions = function () {
		
		for (var i = array_length(obj_dialog.objectTarget.dialog.Messages[obj_dialog.indexMessage].Options) - 1; i >= 0; i--) {
			show_debug_message(hGUI - 250 + (250 * i));
			draw_rectangle_color (
				30,
				hGUI - 220 - (40 * i),
				150,
				hGUI - 250 - (40 * i),
				#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF,
				false
			);
			
		}
	}
}