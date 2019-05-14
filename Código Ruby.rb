class Aluno
#-----------------------ATRIBUTOS - SET & GET--------------------------------
	
	#-------PROVA---------
	def nota_pr= (pr)
   		@nota_pr = pr
  	end
  	def nota_pr
   		@nota_pr
    end
    
    #-------Ma---------
    def nota_ma= (ma)
   		@nota_ma = ma
  	end
  	def nota_ma
   		@nota_ma
    end
    
    #-------Mb---------
    def nota_mb= (mb)
   		@nota_mb = mb
  	end
  	def nota_mb
   		@nota_mb
    end
    
    #-------A1---------
    def nota_a1= (a1)
   		@nota_a1 = a1
  	end
  	def nota_a1
   		@nota_a1
    end
    
    #-------A2---------
    def nota_a2= (a2)
   		@nota_a2 = a2
  	end
  	def nota_a2
   		@nota_a2
    end
    
    #-------MD---------
    def media= (md)
   		@media = md
  	end
  	def media
   		@media
    end
    
    #-------AULAS---------
    def qt_aula= (aula)
   		@qt_aula = aula
  	end
  	def qt_aula
   		@qt_aula
    end
    
    #-------FALTAS---------
    def qt_falta= (falta)
   		@qt_falta = falta
  	end
  	def qt_falta
   		@qt_falta
    end

#---------------------------CONSTRUTOR----------------------------------------
	
	def initialize ()
		print "Declare a quantidade de aulas: "
		self.qt_aula = gets.chomp
		if qt_aula.to_f < 0.0
			abort("ERRO: O numero de aulas nao pode ser negativo")
		end
		
		print "Declare a quantidade de faltas: "
		self.qt_falta = gets.chomp
		if qt_falta.to_f < 0.0
			abort("ERRO: O numero de faltas nao pode ser negativo")
		end	
		self.qt_aula = qt_aula.to_f - (qt_aula.to_f * 0.75) 
		if qt_falta.to_f > qt_aula.to_f
			abort("\nREPROVADO POR FALTAS")
		end	
	end

#-----------------------------METODO------------------------------------------
	
	#----CALCULO--------------
	def calc(bimestre)
		print "\nInforme a nota da P#{bimestre}: "  
		self.nota_pr = gets.chomp
		if nota_pr.to_f < 0.0 or nota_pr.to_f >10.0	
			abort("ERRO: A nota P#{bimestre} deve ser entre 0 e 10!")
		end	
		print "Informe a nota Ma#{bimestre}: "
		self.nota_ma = gets.chomp
		
		if nota_ma.to_f < 0.0 or nota_ma.to_f > 10.0
			abort("ERRO: A nota Ma#{bimestre} deve ser entre 0 e 10!")
		end
		print "Informe a nota Mb#{bimestre}: "
		self.nota_mb = gets.chomp
		
		if nota_mb.to_f < 0.0 or nota_mb.to_f > 10.00
			abort("ERRO: A nota Mb#{bimestre} deve ser entre 0 e 10!")
		end

		if bimestre == 1
			self.nota_a1 = (nota_pr.to_f * 0.7) + (nota_ma.to_f * 0.2) + (nota_mb.to_f * 0.1)	
		else 
			self.nota_a2 = (nota_pr.to_f * 0.7) + (nota_ma.to_f * 0.2) + (nota_mb.to_f * 0.1)
		end	
	end	
	
	#-----MEDIA---------------
	def media
		self.media = (nota_a1.to_f + (nota_a2.to_f * 2)) / 3
	end	

	#----STATUS-FINAL---------
	def status
		        
		if media >= 5.0 and qt_falta.to_f <= qt_aula.to_f
			puts "APROVADO"
		elsif	 media < 5.0 and media >= 3.0 and qt_falta.to_f <= qt_aula.to_f
			puts "RECUPERACAO"
	    else media < 3.0 and qt_falta.to_f <= qt_aula.to_f
			puts "REPROVADO POR NOTA"
		end         
	end	
	
	#----IMPRIMIR-------------
	def imprimir
		puts "\nMEDIA FINAL = #{media.round(2)}\n"
	end	
end	

#---------------------------------------MAIN----------------------------------------
=begin 
"A OO do ruby é diferente, por exemplo, do Java. Em Java precisamos definir uma classe “principal” 
que possui o método estático main para que o código seja executado a partir dali. Em ruby, existe 
uma grande classe que incorpora todo o código. Ou seja, todo código que você escreve está dentro desta classe."
fonte: https://brizeno.wordpress.com/2012/03/23/classes-escopos-e-convencoes-em-ruby/
=end

a = Aluno.new()
a.calc(1)
a.calc(2)
a.media
a.imprimir
a.status




