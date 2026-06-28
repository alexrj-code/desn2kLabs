//Prototype for your assembly function
extern char char_toupper(char input);

int main(void) {
	char string[] = "uSinG funCtions in 'C', yEah!";
	
	//Create a loop and call char_toupper on every character in the string
	int i = 0;
	while (string[i] != '\0') {
		string[i] = char_toupper(string[i]);
		i++;
	}
	
	while(1) { } //Now do nothing more.

	return 0;
}
