library(patternize)


IDListWT <- c("CL01_binary_glare","CL02_binary_glare","CL03_binary_glare","CL04_binary_glare","CL05_binary_glare",
              "CL06_binary_glare","CL07_binary_glare","CL08_binary_glare","CL09_binary_glare","CL10_binary_glare",
              "CL11_binary_glare","CL13_binary_glare","CL14_binary_glare","CL15_binary_glare","CL16_binary_glare")



# make lists with images
prepath <- '~/Documents/GitHub/frogFun/ProcessedImages/BinaryGlare'
extension <- '.png'
imageListWT <- makeList(IDListWT, 'image', prepath, extension)


# choose target image
target <- imageListWT[['CL04_binary_glare']]

# run alignment of color patterns
rasterList_regKWT <- patRegK(imageListWT,target)

rasterList_regKG <- patRegK(imageListG, target, k = 7, resampleFactor = 5, crop = c(200,2800,300,1800), 
                            plot = TRUE, useBlockPercentage = 90, maskOutline = outline_9472, maskColor = 255)

# If you don't want to run the function, you can load the saved output rasterList
# save(rasterList_regKWT, file = 'output/Fig3_rasterList_regKWT.rda')
load('output/Fig3_rasterList_regKWT.rda')
# save(rasterList_regKG, file = 'output/Fig3_rasterList_regKG.rda')
load('output/Fig3_rasterList_regKG.rda')

# sum the colorpatterns
summedRaster_KWT <- sumRaster(rasterList_regKWT, IDListWT, type = 'k')
summedRaster_KG <- sumRaster(rasterList_regKG, IDListG, type = 'k')

# plot heatmaps using the list of summed rasters
plotHeat(summedRaster_KWT, IDListWT, plotCartoon = TRUE, refShape = 'target', outline = outline_9472, 
         crop = c(200,2800,300,1800), flipRaster = 'y', imageList = imageListWT, 
         cartoonOrder = 'under', cartoonFill = 'black')