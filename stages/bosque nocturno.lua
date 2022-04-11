function onCreate()
--RANGO 1 Partes que no consuman muchos recurso o lo esencial.
	makeLuaSprite('cielo', 'angry/CH-RN-00', 0, 0);
    setLuaSpriteScrollFactor('cielo', 0.9, 0.9);
	scaleObject('cielo', 2.0, 2.0);

	makeLuaSprite('bosque', 'angry/CH-RN-01', 0, 200);
    setLuaSpriteScrollFactor('bosque', 1.3, 1.3);
	scaleObject('bosque', 2.0, 2.0);

	makeLuaSprite('piso', 'angry/CH-RN-02', 0, 0);
	scaleObject('piso', 2.0, 2.0);
	
	if not lowQuality then

	makeAnimatedLuaSprite('lluvia', 'angry/NewRAINLayer01', 0, 0);

    setLuaSpriteScrollFactor('lluvia', 0.9, 0.9);

	scaleObject('lluvia', 1.0, 1.0);

	makeAnimatedLuaSprite('lluvia2', 'angry/NewRAINLayer02', 0, 0);

    setLuaSpriteScrollFactor('lluvia2', 0.9, 0.9);

	scaleObject('lluvia2', 1.0, 1.0);

	
	end
--RANGO3 Va a leer en orden y podras usar el setObjectOrder para ponerlo encima de girfriend.

    addLuaSprite('cielo', false);
    addLuaSprite('bosque', false);
    addLuaSprite('piso', false);
    addAnimationByPrefix('lluvia', 'idle', 'RainFirstlayer instance 1', '24', true);
    setObjectOrder('lluvia', '6');
    addAnimationByPrefix('lluvia2', 'idle', 'RainFirstlayer instance 1', '24', true);
    setObjectOrder('lluvia2', '7');


end
