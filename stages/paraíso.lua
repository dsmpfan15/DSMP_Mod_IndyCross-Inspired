function onCreate()
--RANGO 1 Partes que no consuman muchos recurso o lo esencial.
	makeLuaSprite('cielo', 'primero/BG-00', 0, 0);
    setLuaSpriteScrollFactor('cielo', 0.9, 0.9);
	scaleObject('cielo', 2.0, 2.0);

	makeLuaSprite('bosque', 'primero/BG-01', 200, 350);
    setLuaSpriteScrollFactor('bosque', 2.0, 2.0);
	scaleObject('bosque', 2.0, 2.0);

	makeLuaSprite('piso', 'primero/Foreground', 0, 0);
    setLuaSpriteScrollFactor('piso', 0.9, 0.9);
	scaleObject('piso', 2.0, 2.0);
	


	
	if not lowQuality then
--RANGO 2 Agregen lo que quieran y podran desactivarlo en las opciones del psych engine.








	
	end
--RANGO3 Va a leer en orden y podras usar el setObjectOrder para ponerlo encima de girfriend.

    addLuaSprite('cielo', false);
    addLuaSprite('bosque', false);
    addLuaSprite('piso', false);



end
