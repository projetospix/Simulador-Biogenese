extends Control



func TextoAcessivel(b):
	var temaAcessivel = load("res://fontes-e-temas/renascençaAcessivel.tres")
	if b:
		self.theme = temaAcessivel
		print(self)
		
		
