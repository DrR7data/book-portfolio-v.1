header:
	@echo "For Work With Quarto"
ren:
	quarto render 
open:
	open _book/index.html

clean:
	rm -rf _book
create:
	quarto create quarto proyect
creat:
	quarto create project  <name>
#quarto create project <type> <name>
check:
	quarto check


hello:
	@echo "All Right"