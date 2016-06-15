clear
clc

diretorio_imagens = 'imagens/';
extencao = '*.png';
lista_imagens = dir(strcat(diretorio_imagens,extencao)); 

imagensNormais = [];
imagensComprimidas = [];

for i = 1 : length(lista_imagens)
    imagem = strcat(diretorio_imagens,lista_imagens(i).name);
    imagem = imread(imagem);
    
    % Deixa a imagems em preto e branco
    if size(imagem,3)>1
        imagem = im2bw(imagem);
    end
    
    [imgLin,imgCol,P] = size(imagem);
    imagem = double(imagem);
    imagem_vet = reshape(imagem,imgCol*imgLin,1); % Transforma a matriz em um vetor
    
    imagemComprimida = imresize(imagem, 0.5, 'nearest'); % Reduz x0.5 a resoluçao da imagem
   
    % Deixa a imagems em preto e branco
    %if size(imagemComprimida,3)>imagemComprimida
       % imagemComprimida = im2bw(imagemComprimida);
    %end
    
    %imagemComprimida = double(imagemComprimida);
    [imgCLin,imgCCol,p] = size(imagemComprimida);
    imagemComprimida_vet = reshape(imagemComprimida,imgCCol*imgCLin,1);
    
    if i==6
        gg = imagemComprimida_vet;
        figure, imshow(imagem);
        figure, imshow(imagemComprimida);
    else
        imagensNormais = [imagensNormais imagem_vet];
        imagensComprimidas = [imagensComprimidas imagemComprimida_vet];          
    end
    

end

%redeComprime = perceptron;
%view(redComprime)
%redeComprime = train(redeComprime,imagensNormais,imagensComprimidas);

%teste = redeComprime(gg);
%teste_vec = reshape(teste,[imgCLin imgCCol p]);
%figure, imshow(teste_vec);

redeExpande = perceptron;
view(redeExpande);
redeExpande = train(redeExpande,imagensComprimidas,imagensNormais);

teste = redeExpande(gg);
teste_vec = reshape(teste,[imgLin imgCol P]);
figure, imshow(teste_vec);





