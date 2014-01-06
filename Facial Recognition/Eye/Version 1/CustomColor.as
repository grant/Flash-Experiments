package {
	public class CustomColor {
		/**
		 * Compares 2 colors and and sees how similar they are
		 * @return (0-100) how close the colors are to each other
		 **/
		public static function compareColor(color1:uint,color2:uint):uint {
			var rgb1:Object = hexToRGB(color1);
			var rgb2:Object = hexToRGB(color2);
			
			var answer:uint = (Math.abs(rgb1.red-rgb2.red)+Math.abs(rgb1.green-rgb2.green)+Math.abs(rgb1.blue-rgb2.blue));
			return answer; 
		}
		
		/**
		 * Gets an RGB object from hex
		 * @return A RGB object
		 **/
		private static function hexToRGB(hex:uint):Object {
			var rgbObj:Object = {
				red: ((hex & 0xFF0000) >> 16),
				green: ((hex & 0x00FF00) >> 8),
				blue: ((hex & 0x0000FF))
			};
 			return rgbObj;
		}
	}
}