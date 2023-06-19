#La librería ggplot2 es un paquete de visualización de datos que utiliza "Gramática de los Gráficos"
#básicamente es una representación en capas de lo que se dibuja en dichos gráficos

#se manda llamar a la librería
library(ggplot2)
#se manda llamar la librería para poder leer la base de datos para este ejemplo
library(readr)

#se manda llamar la base de datos
deep_sea_corals <- read_csv("deep_sea_corals.csv")

#Se tiene el primer argumento ggplot(), el primer dato que recibe es el dataset que se graficará
#luego se tiene el comando aes(), este se usa para graficar el conjunto de datos que representa
#al eje x, después de terminar el argumento de ggplot() se le agrega con un + el comando 
#geom_bar() para indicar el uso de una gráfica de barras
ggplot(data = deep_sea_corals, aes(x = DataProvider)) + geom_bar()

#Para este caso, se utiliza el mismo primer comando de ggplot(), sumado de un geom_bar(), sumado con el comando xlab()
#el cual da el nombre a nuestro eje x, de igual manera el comando ylab() que le da el nombre al
#eje y, por último se tiene el comando ggtitle que le da el título a la gráfica que nos encontramos ploteando

ggplot(data = deep_sea_corals, aes(x = DataProvider)) + 
  geom_bar() + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1")

#El comando geom_bar se puede modificar tambien para poder darle una vista diferente a nuestro
#gráfico, por ejemplo, agregando color y fill, el primer comando le da el color al perímetro de 
#las barras de nuestro gráfico, el segundo comando le da el color de relleno que estas

ggplot(data = deep_sea_corals, aes(x = DataProvider)) + 
  geom_bar(color = 'pink', fill = 'turquoise') + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1")

#También se puede cambiar la orientación del gráfico de barras en este caso sumando el 
#comando coord_flip()

ggplot(data = deep_sea_corals, aes(x = DataProvider)) + 
  geom_bar(color = 'pink', fill = 'turquoise') + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1") + 
  coord_flip()

#Para el caso de que se quiera distinguir cada una de las barras se utiliza el comando geom_bar() por
#sí solo, nuestra variable  x la usamos como una variable tipo factor para poder hacer la distinción de
#cada uno de los valores de x. De igual manera adicionamos el comando labs() el cual nos ayuda a darle
#un título a la lista de variables que tiene x

ggplot(data = deep_sea_corals, aes(x = DataProvider, fill = as.factor(DataProvider))) + 
  geom_bar() + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1") + 
  labs(fill = "Proveedores")

#Para el caso de querer cambiar el fondo de nuestra gráfica, se suma el comando theme_minimal()
#comenzando por uno

ggplot(data = deep_sea_corals, aes(x = DataProvider, fill = as.factor(DataProvider))) + 
  geom_bar() + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1") + 
  labs(fill = "Proveedores") +
  theme_minimal()

#Dado fuera el caso de que de que se usaran ambos comandos al mismo tiempo, es decir el colorear cada
#columna de un color y el delinear cada columna con un solo color y rellenarlas todas con otro
#mismo color, solo se tomaría en cuenta el segundo caso pues "sobreescribe" los argumentos de ggplot()

ggplot(data = deep_sea_corals, aes(x = DataProvider, fill = as.factor(DataProvider))) + 
  geom_bar(color = 'pink', fill = 'turquoise') + 
  xlab("Proveeder de la informacion") + 
  ylab("Cantidades") + 
  ggtitle("Gráfico 1") + 
  labs(fill = "Proveedores") +
  theme_minimal()

###################### Gráfico de dispersiòn ###################

#Para poder usar un gráfico de densidad el comando ggplot no solo recibe la variable x sino tambièn lo que 
#tendrá en la variable y

#Se manda llamar otra dataset para poder revisar algunos otros comandos de ggplot2

UsuariosLenguasExtranjeras2017 <- read_csv("UsuariosLenguasExtranjeras2017.csv")

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point() +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#De igual manera se pueden modificar las visualizaciones que se tienen de los datos que se tienen en esta gráfica, 
#como la forma, color y transparencia

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(color = 'turquoise', fill = 'turquoise', size = 4, shape = 18, alpha = 0.5) +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#Si se necesitara ver de alguna manera la tendencia que siguen los datos que tenemos de nuestra dataset, solo es
#necesario usar el comando geom_smooth(), de esta manera nos dará la idea de la tendencia de nuestros datos

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(color = 'purple', fill = 'purple', size = 4, shape = 18, alpha = 0.5) +
  geom_smooth(color = 'turquoise') +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#Para poder agrupar todo por colores basándose en los datos de una de las columnas de nuestra dataset, solo es
#necesario agregar al color el nombre en la columna que queremos basar los colores, dentro del comando dentro de 
#geom_point()

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(aes(color = IDIOMA), size = 2, alpha = 0.7) +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#No solo se puede agregar la tendencia a un solo grupo de datos, también se puede hacer para cada uno de los datos que
#se tienen resaltados en nuestra gráfica, en este caso con los idiomas, aunque este ejemplo no ayuda mucho a verlo

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(aes(color = IDIOMA), size = 2, alpha = 0.7) +
  geom_smooth(aes(color = IDIOMA), fill = NA) +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#Haciendo uso del comando facet_grid(), se pueden dividir los distintos grupos de datos para poder observarlos/analizarlos
#en una gráfica distinta cada uno pero aún viéndolos en un mismo recuadro

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(aes(color = IDIOMA), size = 1, alpha = 0.7) +
  geom_smooth(aes(color = IDIOMA)) +
  facet_grid(IDIOMA~., scales = 'free') +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()

#Más aún, se pueden dividir basándose en los datos que nos puedan presentar alguna otra de las columnas de nuestra dataset
#y no solo verlo dividido en los datos de nuestra lista, esto nos da paso a poder hacer una revisión más exaustiva de
#los datos que se encuentran manejando

ggplot(data = UsuariosLenguasExtranjeras2017, aes(x = CENLEX_HOMBRES, y = CENLEX_MUJERES)) + 
  geom_point(aes(color = IDIOMA), size = 1, alpha = 0.7) +
  geom_smooth(aes(color = IDIOMA)) +
  facet_grid(IDIOMA~CELEX_HOMBRES, scales = 'free') +
  xlab('CENLEX Hombres') + 
  ylab('CENLEX Mujeres') +
  ggtitle('Relación entre CENLEX hombres y mujeres') + 
  theme_minimal()
