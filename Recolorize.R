library(recolorize)

#img_cmr <- readImage("~/Documents/Opumilio/Samples/photos for Diana/CMR06_Br30.png", resize=.65,rotate=270)
#dim(img)
#recolorize_cmr <- recolorize2(img_cmr,cutoff=5)
#img_cl <- readImage("~/Documents/Opumilio/Samples/photos for Diana/CL02_Br30.png",resize=.65,rotate=90)
#dim(img)
#recolorize_cl <- recolorize2(img_cl,cutoff=25)


img <- readImage("sampleImages/Cemetery/Red/CMR01-PD.png",
                    resize=.65,rotate=90)
dim(img)
recolorize <- recolorize2(img,cutoff=2)
