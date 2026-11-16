-- SPDX-License-Identifier: MIT
-- Editable campaign source. All durable progress belongs to engine state and actor inventories.
local cfg={["day"]=15,["id"]="silent-farm",["title"]="Silent Farm",["reference"]="XCOM",["boss"]="A psionic Overseer protects a command node and attempts to disorient exposed soldiers. Cut two conduits, keep sightlines blocked, and reserve reaction shots for its movement. In phase two it opens side doors and advances. Defeating it and securing the node completes the mission.",["concept_art"]={["exploration"]="art/concepts/15-silent-farm-exploration.png",["finale"]="art/concepts/15-silent-farm-finale.png"},["sectors"]={"Field perimeter","Orchard","Hay barn","Grain stores","Irrigation works","Landing pad","Engine bay","Command deck"},["palette"]={"#253f58","#76cbea","#b5de59"},["speed"]=4.5,["mode"]="tactical",["cell_metres"]=6,["target_minutes"]={["solo"]={35,60},["cooperative"]={30,55}},["pacing_status"]="authored target; ordinary-input and human timing qualification required",["goals"]={{13,28,43,58,73,88},{13,29,46,61,77,94},{13,29,46,61,77,94},{14,31,48,64,81,98},{13,28,43,58,73,88},{13,29,46,61,77,94},{13,29,46,61,77,94},{14,31,48,64,81,98}},["nodes"]={{{33.0,0.02,21.0,18},{51.0,0.02,21.0,18},{69.0,0.02,21.0,18},{87.0,0.02,21.0,18},{105.0,0.02,21.0,18},{123.0,0.02,21.0,18},{141.0,0.02,21.0,18},{159.0,0.02,21.0,18},{177.0,0.02,21.0,18},{195.0,0.02,21.0,18},{213.0,0.02,21.0,18},{231.0,0.02,21.0,18},{249.0,0.02,21.0,18},{255.0,0.02,21.0,18},{255.0,0.02,33.0,18},{255.0,0.02,51.0,18},{237.0,0.02,51.0,18},{219.0,0.02,51.0,18},{201.0,0.02,51.0,18},{183.0,0.02,51.0,18},{165.0,0.02,51.0,18},{147.0,0.02,51.0,18},{129.0,0.02,51.0,18},{111.0,0.02,51.0,18},{93.0,0.02,51.0,18},{75.0,0.02,51.0,18},{57.0,0.02,51.0,18},{39.0,0.02,51.0,18},{33.0,0.02,51.0,18},{33.0,0.02,63.0,18},{33.0,0.02,81.0,18},{51.0,0.02,81.0,18},{69.0,0.02,81.0,18},{87.0,0.02,81.0,18},{105.0,0.02,81.0,18},{123.0,0.02,81.0,18},{141.0,0.02,81.0,18},{159.0,0.02,81.0,18},{177.0,0.02,81.0,18},{195.0,0.02,81.0,18},{213.0,0.02,81.0,18},{231.0,0.02,81.0,18},{249.0,0.02,81.0,18},{255.0,0.02,81.0,18},{255.0,0.02,93.0,18},{255.0,0.02,111.0,18},{237.0,0.02,111.0,18},{219.0,0.02,111.0,18},{201.0,0.02,111.0,18},{183.0,0.02,111.0,18},{165.0,0.02,111.0,18},{147.0,0.02,111.0,18},{129.0,0.02,111.0,18},{111.0,0.02,111.0,18},{93.0,0.02,111.0,18},{75.0,0.02,111.0,18},{57.0,0.02,111.0,18},{39.0,0.02,111.0,18},{33.0,0.02,111.0,18},{33.0,0.02,123.0,18},{33.0,0.02,141.0,18},{51.0,0.02,141.0,18},{69.0,0.02,141.0,18},{87.0,0.02,141.0,18},{105.0,0.02,141.0,18},{123.0,0.02,141.0,18},{141.0,0.02,141.0,18},{159.0,0.02,141.0,18},{177.0,0.02,141.0,18},{195.0,0.02,141.0,18},{213.0,0.02,141.0,18},{231.0,0.02,141.0,18},{249.0,0.02,141.0,18},{255.0,0.02,141.0,18},{255.0,0.02,153.0,18},{255.0,0.02,171.0,18},{237.0,0.02,171.0,18},{219.0,0.02,171.0,18},{201.0,0.02,171.0,18},{183.0,0.02,171.0,18},{165.0,0.02,171.0,18},{147.0,0.02,171.0,18},{129.0,0.02,171.0,18},{111.0,0.02,171.0,18},{93.0,0.02,171.0,18},{75.0,0.02,171.0,18},{57.0,0.02,171.0,18},{39.0,0.02,171.0,18},{33.0,0.02,171.0,18},{183.0,0.02,63.0,18},{165.0,0.02,63.0,18},{147.0,0.02,63.0,18},{129.0,0.02,63.0,18},{111.0,0.02,63.0,18},{105.0,0.02,153.0,18},{123.0,0.02,153.0,18},{141.0,0.02,153.0,18},{159.0,0.02,153.0,18},{177.0,0.02,153.0,18}},{{267.0,0.02,21.0,18},{249.0,0.02,21.0,18},{231.0,0.02,21.0,18},{213.0,0.02,21.0,18},{195.0,0.02,21.0,18},{177.0,0.02,21.0,18},{159.0,0.02,21.0,18},{141.0,0.02,21.0,18},{123.0,0.02,21.0,18},{105.0,0.02,21.0,18},{87.0,0.02,21.0,18},{69.0,0.02,21.0,18},{51.0,0.02,21.0,18},{33.0,0.02,21.0,18},{33.0,0.02,39.0,18},{33.0,0.02,51.0,18},{39.0,0.02,51.0,18},{57.0,0.02,51.0,18},{75.0,0.02,51.0,18},{93.0,0.02,51.0,18},{111.0,0.02,51.0,18},{129.0,0.02,51.0,18},{147.0,0.02,51.0,18},{165.0,0.02,51.0,18},{183.0,0.02,51.0,18},{201.0,0.02,51.0,18},{219.0,0.02,51.0,18},{237.0,0.02,51.0,18},{255.0,0.02,51.0,18},{267.0,0.02,51.0,18},{267.0,0.02,57.0,18},{267.0,0.02,75.0,18},{267.0,0.02,81.0,18},{255.0,0.02,81.0,18},{237.0,0.02,81.0,18},{219.0,0.02,81.0,18},{201.0,0.02,81.0,18},{183.0,0.02,81.0,18},{165.0,0.02,81.0,18},{147.0,0.02,81.0,18},{129.0,0.02,81.0,18},{111.0,0.02,81.0,18},{93.0,0.02,81.0,18},{75.0,0.02,81.0,18},{57.0,0.02,81.0,18},{39.0,0.02,81.0,18},{33.0,0.02,81.0,18},{33.0,0.02,93.0,18},{33.0,0.02,111.0,18},{51.0,0.02,111.0,18},{69.0,0.02,111.0,18},{87.0,0.02,111.0,18},{105.0,0.02,111.0,18},{123.0,0.02,111.0,18},{141.0,0.02,111.0,18},{159.0,0.02,111.0,18},{177.0,0.02,111.0,18},{195.0,0.02,111.0,18},{213.0,0.02,111.0,18},{231.0,0.02,111.0,18},{249.0,0.02,111.0,18},{267.0,0.02,111.0,18},{267.0,0.02,129.0,18},{267.0,0.02,141.0,18},{261.0,0.02,141.0,18},{243.0,0.02,141.0,18},{225.0,0.02,141.0,18},{207.0,0.02,141.0,18},{189.0,0.02,141.0,18},{171.0,0.02,141.0,18},{153.0,0.02,141.0,18},{135.0,0.02,141.0,18},{117.0,0.02,141.0,18},{99.0,0.02,141.0,18},{81.0,0.02,141.0,18},{63.0,0.02,141.0,18},{45.0,0.02,141.0,18},{33.0,0.02,141.0,18},{33.0,0.02,147.0,18},{33.0,0.02,165.0,18},{33.0,0.02,171.0,18},{45.0,0.02,171.0,18},{63.0,0.02,171.0,18},{81.0,0.02,171.0,18},{99.0,0.02,171.0,18},{117.0,0.02,171.0,18},{135.0,0.02,171.0,18},{153.0,0.02,171.0,18},{171.0,0.02,171.0,18},{189.0,0.02,171.0,18},{207.0,0.02,171.0,18},{225.0,0.02,171.0,18},{243.0,0.02,171.0,18},{261.0,0.02,171.0,18},{267.0,0.02,171.0,18},{93.0,0.02,63.0,18},{111.0,0.02,63.0,18},{129.0,0.02,63.0,18},{147.0,0.02,63.0,18},{165.0,0.02,63.0,18},{207.0,0.02,153.0,18},{189.0,0.02,153.0,18},{171.0,0.02,153.0,18},{153.0,0.02,153.0,18},{135.0,0.02,153.0,18}},{{33.0,0.02,171.0,18},{51.0,0.02,171.0,18},{69.0,0.02,171.0,18},{87.0,0.02,171.0,18},{105.0,0.02,171.0,18},{123.0,0.02,171.0,18},{141.0,0.02,171.0,18},{159.0,0.02,171.0,18},{177.0,0.02,171.0,18},{195.0,0.02,171.0,18},{213.0,0.02,171.0,18},{231.0,0.02,171.0,18},{249.0,0.02,171.0,18},{267.0,0.02,171.0,18},{267.0,0.02,153.0,18},{267.0,0.02,141.0,18},{261.0,0.02,141.0,18},{243.0,0.02,141.0,18},{225.0,0.02,141.0,18},{207.0,0.02,141.0,18},{189.0,0.02,141.0,18},{171.0,0.02,141.0,18},{153.0,0.02,141.0,18},{135.0,0.02,141.0,18},{117.0,0.02,141.0,18},{99.0,0.02,141.0,18},{81.0,0.02,141.0,18},{63.0,0.02,141.0,18},{45.0,0.02,141.0,18},{33.0,0.02,141.0,18},{33.0,0.02,135.0,18},{33.0,0.02,117.0,18},{33.0,0.02,111.0,18},{45.0,0.02,111.0,18},{63.0,0.02,111.0,18},{81.0,0.02,111.0,18},{99.0,0.02,111.0,18},{117.0,0.02,111.0,18},{135.0,0.02,111.0,18},{153.0,0.02,111.0,18},{171.0,0.02,111.0,18},{189.0,0.02,111.0,18},{207.0,0.02,111.0,18},{225.0,0.02,111.0,18},{243.0,0.02,111.0,18},{261.0,0.02,111.0,18},{267.0,0.02,111.0,18},{267.0,0.02,99.0,18},{267.0,0.02,81.0,18},{249.0,0.02,81.0,18},{231.0,0.02,81.0,18},{213.0,0.02,81.0,18},{195.0,0.02,81.0,18},{177.0,0.02,81.0,18},{159.0,0.02,81.0,18},{141.0,0.02,81.0,18},{123.0,0.02,81.0,18},{105.0,0.02,81.0,18},{87.0,0.02,81.0,18},{69.0,0.02,81.0,18},{51.0,0.02,81.0,18},{33.0,0.02,81.0,18},{33.0,0.02,63.0,18},{33.0,0.02,51.0,18},{39.0,0.02,51.0,18},{57.0,0.02,51.0,18},{75.0,0.02,51.0,18},{93.0,0.02,51.0,18},{111.0,0.02,51.0,18},{129.0,0.02,51.0,18},{147.0,0.02,51.0,18},{165.0,0.02,51.0,18},{183.0,0.02,51.0,18},{201.0,0.02,51.0,18},{219.0,0.02,51.0,18},{237.0,0.02,51.0,18},{255.0,0.02,51.0,18},{267.0,0.02,51.0,18},{267.0,0.02,45.0,18},{267.0,0.02,27.0,18},{267.0,0.02,21.0,18},{255.0,0.02,21.0,18},{237.0,0.02,21.0,18},{219.0,0.02,21.0,18},{201.0,0.02,21.0,18},{183.0,0.02,21.0,18},{165.0,0.02,21.0,18},{147.0,0.02,21.0,18},{129.0,0.02,21.0,18},{111.0,0.02,21.0,18},{93.0,0.02,21.0,18},{75.0,0.02,21.0,18},{57.0,0.02,21.0,18},{39.0,0.02,21.0,18},{33.0,0.02,21.0,18},{207.0,0.02,129.0,18},{189.0,0.02,129.0,18},{171.0,0.02,129.0,18},{153.0,0.02,129.0,18},{135.0,0.02,129.0,18},{93.0,0.02,39.0,18},{111.0,0.02,39.0,18},{129.0,0.02,39.0,18},{147.0,0.02,39.0,18},{165.0,0.02,39.0,18}},{{267.0,0.02,21.0,18},{249.0,0.02,21.0,18},{231.0,0.02,21.0,18},{213.0,0.02,21.0,18},{195.0,0.02,21.0,18},{177.0,0.02,21.0,18},{159.0,0.02,21.0,18},{141.0,0.02,21.0,18},{123.0,0.02,21.0,18},{105.0,0.02,21.0,18},{87.0,0.02,21.0,18},{69.0,0.02,21.0,18},{51.0,0.02,21.0,18},{33.0,0.02,21.0,18},{21.0,0.02,21.0,18},{21.0,0.02,27.0,18},{21.0,0.02,45.0,18},{21.0,0.02,51.0,18},{33.0,0.02,51.0,18},{51.0,0.02,51.0,18},{69.0,0.02,51.0,18},{87.0,0.02,51.0,18},{105.0,0.02,51.0,18},{123.0,0.02,51.0,18},{141.0,0.02,51.0,18},{159.0,0.02,51.0,18},{177.0,0.02,51.0,18},{195.0,0.02,51.0,18},{213.0,0.02,51.0,18},{231.0,0.02,51.0,18},{249.0,0.02,51.0,18},{267.0,0.02,51.0,18},{267.0,0.02,69.0,18},{267.0,0.02,81.0,18},{261.0,0.02,81.0,18},{243.0,0.02,81.0,18},{225.0,0.02,81.0,18},{207.0,0.02,81.0,18},{189.0,0.02,81.0,18},{171.0,0.02,81.0,18},{153.0,0.02,81.0,18},{135.0,0.02,81.0,18},{117.0,0.02,81.0,18},{99.0,0.02,81.0,18},{81.0,0.02,81.0,18},{63.0,0.02,81.0,18},{45.0,0.02,81.0,18},{27.0,0.02,81.0,18},{21.0,0.02,81.0,18},{21.0,0.02,93.0,18},{21.0,0.02,111.0,18},{39.0,0.02,111.0,18},{57.0,0.02,111.0,18},{75.0,0.02,111.0,18},{93.0,0.02,111.0,18},{111.0,0.02,111.0,18},{129.0,0.02,111.0,18},{147.0,0.02,111.0,18},{165.0,0.02,111.0,18},{183.0,0.02,111.0,18},{201.0,0.02,111.0,18},{219.0,0.02,111.0,18},{237.0,0.02,111.0,18},{255.0,0.02,111.0,18},{267.0,0.02,111.0,18},{267.0,0.02,117.0,18},{267.0,0.02,135.0,18},{267.0,0.02,141.0,18},{255.0,0.02,141.0,18},{237.0,0.02,141.0,18},{219.0,0.02,141.0,18},{201.0,0.02,141.0,18},{183.0,0.02,141.0,18},{165.0,0.02,141.0,18},{147.0,0.02,141.0,18},{129.0,0.02,141.0,18},{111.0,0.02,141.0,18},{93.0,0.02,141.0,18},{75.0,0.02,141.0,18},{57.0,0.02,141.0,18},{39.0,0.02,141.0,18},{21.0,0.02,141.0,18},{21.0,0.02,159.0,18},{21.0,0.02,171.0,18},{27.0,0.02,171.0,18},{45.0,0.02,171.0,18},{63.0,0.02,171.0,18},{81.0,0.02,171.0,18},{99.0,0.02,171.0,18},{117.0,0.02,171.0,18},{135.0,0.02,171.0,18},{153.0,0.02,171.0,18},{171.0,0.02,171.0,18},{189.0,0.02,171.0,18},{207.0,0.02,171.0,18},{225.0,0.02,171.0,18},{243.0,0.02,171.0,18},{261.0,0.02,171.0,18},{267.0,0.02,171.0,18},{87.0,0.02,63.0,18},{105.0,0.02,63.0,18},{123.0,0.02,63.0,18},{141.0,0.02,63.0,18},{159.0,0.02,63.0,18},{201.0,0.02,153.0,18},{183.0,0.02,153.0,18},{165.0,0.02,153.0,18},{147.0,0.02,153.0,18},{129.0,0.02,153.0,18}},{{33.0,0.02,21.0,18},{51.0,0.02,21.0,18},{69.0,0.02,21.0,18},{87.0,0.02,21.0,18},{105.0,0.02,21.0,18},{123.0,0.02,21.0,18},{141.0,0.02,21.0,18},{159.0,0.02,21.0,18},{177.0,0.02,21.0,18},{195.0,0.02,21.0,18},{213.0,0.02,21.0,18},{231.0,0.02,21.0,18},{249.0,0.02,21.0,18},{255.0,0.02,21.0,18},{255.0,0.02,33.0,18},{255.0,0.02,51.0,18},{237.0,0.02,51.0,18},{219.0,0.02,51.0,18},{201.0,0.02,51.0,18},{183.0,0.02,51.0,18},{165.0,0.02,51.0,18},{147.0,0.02,51.0,18},{129.0,0.02,51.0,18},{111.0,0.02,51.0,18},{93.0,0.02,51.0,18},{75.0,0.02,51.0,18},{57.0,0.02,51.0,18},{39.0,0.02,51.0,18},{33.0,0.02,51.0,18},{33.0,0.02,63.0,18},{33.0,0.02,81.0,18},{51.0,0.02,81.0,18},{69.0,0.02,81.0,18},{87.0,0.02,81.0,18},{105.0,0.02,81.0,18},{123.0,0.02,81.0,18},{141.0,0.02,81.0,18},{159.0,0.02,81.0,18},{177.0,0.02,81.0,18},{195.0,0.02,81.0,18},{213.0,0.02,81.0,18},{231.0,0.02,81.0,18},{249.0,0.02,81.0,18},{255.0,0.02,81.0,18},{255.0,0.02,93.0,18},{255.0,0.02,111.0,18},{237.0,0.02,111.0,18},{219.0,0.02,111.0,18},{201.0,0.02,111.0,18},{183.0,0.02,111.0,18},{165.0,0.02,111.0,18},{147.0,0.02,111.0,18},{129.0,0.02,111.0,18},{111.0,0.02,111.0,18},{93.0,0.02,111.0,18},{75.0,0.02,111.0,18},{57.0,0.02,111.0,18},{39.0,0.02,111.0,18},{33.0,0.02,111.0,18},{33.0,0.02,123.0,18},{33.0,0.02,141.0,18},{51.0,0.02,141.0,18},{69.0,0.02,141.0,18},{87.0,0.02,141.0,18},{105.0,0.02,141.0,18},{123.0,0.02,141.0,18},{141.0,0.02,141.0,18},{159.0,0.02,141.0,18},{177.0,0.02,141.0,18},{195.0,0.02,141.0,18},{213.0,0.02,141.0,18},{231.0,0.02,141.0,18},{249.0,0.02,141.0,18},{255.0,0.02,141.0,18},{255.0,0.02,153.0,18},{255.0,0.02,171.0,18},{237.0,0.02,171.0,18},{219.0,0.02,171.0,18},{201.0,0.02,171.0,18},{183.0,0.02,171.0,18},{165.0,0.02,171.0,18},{147.0,0.02,171.0,18},{129.0,0.02,171.0,18},{111.0,0.02,171.0,18},{93.0,0.02,171.0,18},{75.0,0.02,171.0,18},{57.0,0.02,171.0,18},{39.0,0.02,171.0,18},{33.0,0.02,171.0,18},{183.0,0.02,63.0,18},{165.0,0.02,63.0,18},{147.0,0.02,63.0,18},{129.0,0.02,63.0,18},{111.0,0.02,63.0,18},{105.0,0.02,153.0,18},{123.0,0.02,153.0,18},{141.0,0.02,153.0,18},{159.0,0.02,153.0,18},{177.0,0.02,153.0,18}},{{267.0,0.02,171.0,18},{249.0,0.02,171.0,18},{231.0,0.02,171.0,18},{213.0,0.02,171.0,18},{195.0,0.02,171.0,18},{177.0,0.02,171.0,18},{159.0,0.02,171.0,18},{141.0,0.02,171.0,18},{123.0,0.02,171.0,18},{105.0,0.02,171.0,18},{87.0,0.02,171.0,18},{69.0,0.02,171.0,18},{51.0,0.02,171.0,18},{33.0,0.02,171.0,18},{33.0,0.02,153.0,18},{33.0,0.02,141.0,18},{39.0,0.02,141.0,18},{57.0,0.02,141.0,18},{75.0,0.02,141.0,18},{93.0,0.02,141.0,18},{111.0,0.02,141.0,18},{129.0,0.02,141.0,18},{147.0,0.02,141.0,18},{165.0,0.02,141.0,18},{183.0,0.02,141.0,18},{201.0,0.02,141.0,18},{219.0,0.02,141.0,18},{237.0,0.02,141.0,18},{255.0,0.02,141.0,18},{267.0,0.02,141.0,18},{267.0,0.02,135.0,18},{267.0,0.02,117.0,18},{267.0,0.02,111.0,18},{255.0,0.02,111.0,18},{237.0,0.02,111.0,18},{219.0,0.02,111.0,18},{201.0,0.02,111.0,18},{183.0,0.02,111.0,18},{165.0,0.02,111.0,18},{147.0,0.02,111.0,18},{129.0,0.02,111.0,18},{111.0,0.02,111.0,18},{93.0,0.02,111.0,18},{75.0,0.02,111.0,18},{57.0,0.02,111.0,18},{39.0,0.02,111.0,18},{33.0,0.02,111.0,18},{33.0,0.02,99.0,18},{33.0,0.02,81.0,18},{51.0,0.02,81.0,18},{69.0,0.02,81.0,18},{87.0,0.02,81.0,18},{105.0,0.02,81.0,18},{123.0,0.02,81.0,18},{141.0,0.02,81.0,18},{159.0,0.02,81.0,18},{177.0,0.02,81.0,18},{195.0,0.02,81.0,18},{213.0,0.02,81.0,18},{231.0,0.02,81.0,18},{249.0,0.02,81.0,18},{267.0,0.02,81.0,18},{267.0,0.02,63.0,18},{267.0,0.02,51.0,18},{261.0,0.02,51.0,18},{243.0,0.02,51.0,18},{225.0,0.02,51.0,18},{207.0,0.02,51.0,18},{189.0,0.02,51.0,18},{171.0,0.02,51.0,18},{153.0,0.02,51.0,18},{135.0,0.02,51.0,18},{117.0,0.02,51.0,18},{99.0,0.02,51.0,18},{81.0,0.02,51.0,18},{63.0,0.02,51.0,18},{45.0,0.02,51.0,18},{33.0,0.02,51.0,18},{33.0,0.02,45.0,18},{33.0,0.02,27.0,18},{33.0,0.02,21.0,18},{45.0,0.02,21.0,18},{63.0,0.02,21.0,18},{81.0,0.02,21.0,18},{99.0,0.02,21.0,18},{117.0,0.02,21.0,18},{135.0,0.02,21.0,18},{153.0,0.02,21.0,18},{171.0,0.02,21.0,18},{189.0,0.02,21.0,18},{207.0,0.02,21.0,18},{225.0,0.02,21.0,18},{243.0,0.02,21.0,18},{261.0,0.02,21.0,18},{267.0,0.02,21.0,18},{93.0,0.02,129.0,18},{111.0,0.02,129.0,18},{129.0,0.02,129.0,18},{147.0,0.02,129.0,18},{165.0,0.02,129.0,18},{207.0,0.02,39.0,18},{189.0,0.02,39.0,18},{171.0,0.02,39.0,18},{153.0,0.02,39.0,18},{135.0,0.02,39.0,18}},{{33.0,0.02,21.0,18},{51.0,0.02,21.0,18},{69.0,0.02,21.0,18},{87.0,0.02,21.0,18},{105.0,0.02,21.0,18},{123.0,0.02,21.0,18},{141.0,0.02,21.0,18},{159.0,0.02,21.0,18},{177.0,0.02,21.0,18},{195.0,0.02,21.0,18},{213.0,0.02,21.0,18},{231.0,0.02,21.0,18},{249.0,0.02,21.0,18},{267.0,0.02,21.0,18},{267.0,0.02,39.0,18},{267.0,0.02,51.0,18},{261.0,0.02,51.0,18},{243.0,0.02,51.0,18},{225.0,0.02,51.0,18},{207.0,0.02,51.0,18},{189.0,0.02,51.0,18},{171.0,0.02,51.0,18},{153.0,0.02,51.0,18},{135.0,0.02,51.0,18},{117.0,0.02,51.0,18},{99.0,0.02,51.0,18},{81.0,0.02,51.0,18},{63.0,0.02,51.0,18},{45.0,0.02,51.0,18},{33.0,0.02,51.0,18},{33.0,0.02,57.0,18},{33.0,0.02,75.0,18},{33.0,0.02,81.0,18},{45.0,0.02,81.0,18},{63.0,0.02,81.0,18},{81.0,0.02,81.0,18},{99.0,0.02,81.0,18},{117.0,0.02,81.0,18},{135.0,0.02,81.0,18},{153.0,0.02,81.0,18},{171.0,0.02,81.0,18},{189.0,0.02,81.0,18},{207.0,0.02,81.0,18},{225.0,0.02,81.0,18},{243.0,0.02,81.0,18},{261.0,0.02,81.0,18},{267.0,0.02,81.0,18},{267.0,0.02,93.0,18},{267.0,0.02,111.0,18},{249.0,0.02,111.0,18},{231.0,0.02,111.0,18},{213.0,0.02,111.0,18},{195.0,0.02,111.0,18},{177.0,0.02,111.0,18},{159.0,0.02,111.0,18},{141.0,0.02,111.0,18},{123.0,0.02,111.0,18},{105.0,0.02,111.0,18},{87.0,0.02,111.0,18},{69.0,0.02,111.0,18},{51.0,0.02,111.0,18},{33.0,0.02,111.0,18},{33.0,0.02,129.0,18},{33.0,0.02,141.0,18},{39.0,0.02,141.0,18},{57.0,0.02,141.0,18},{75.0,0.02,141.0,18},{93.0,0.02,141.0,18},{111.0,0.02,141.0,18},{129.0,0.02,141.0,18},{147.0,0.02,141.0,18},{165.0,0.02,141.0,18},{183.0,0.02,141.0,18},{201.0,0.02,141.0,18},{219.0,0.02,141.0,18},{237.0,0.02,141.0,18},{255.0,0.02,141.0,18},{267.0,0.02,141.0,18},{267.0,0.02,147.0,18},{267.0,0.02,165.0,18},{267.0,0.02,171.0,18},{255.0,0.02,171.0,18},{237.0,0.02,171.0,18},{219.0,0.02,171.0,18},{201.0,0.02,171.0,18},{183.0,0.02,171.0,18},{165.0,0.02,171.0,18},{147.0,0.02,171.0,18},{129.0,0.02,171.0,18},{111.0,0.02,171.0,18},{93.0,0.02,171.0,18},{75.0,0.02,171.0,18},{57.0,0.02,171.0,18},{39.0,0.02,171.0,18},{33.0,0.02,171.0,18},{207.0,0.02,63.0,18},{189.0,0.02,63.0,18},{171.0,0.02,63.0,18},{153.0,0.02,63.0,18},{135.0,0.02,63.0,18},{93.0,0.02,153.0,18},{111.0,0.02,153.0,18},{129.0,0.02,153.0,18},{147.0,0.02,153.0,18},{165.0,0.02,153.0,18}},{{267.0,0.02,21.0,18},{249.0,0.02,21.0,18},{231.0,0.02,21.0,18},{213.0,0.02,21.0,18},{195.0,0.02,21.0,18},{177.0,0.02,21.0,18},{159.0,0.02,21.0,18},{141.0,0.02,21.0,18},{123.0,0.02,21.0,18},{105.0,0.02,21.0,18},{87.0,0.02,21.0,18},{69.0,0.02,21.0,18},{51.0,0.02,21.0,18},{33.0,0.02,21.0,18},{21.0,0.02,21.0,18},{21.0,0.02,27.0,18},{21.0,0.02,45.0,18},{21.0,0.02,51.0,18},{33.0,0.02,51.0,18},{51.0,0.02,51.0,18},{69.0,0.02,51.0,18},{87.0,0.02,51.0,18},{105.0,0.02,51.0,18},{123.0,0.02,51.0,18},{141.0,0.02,51.0,18},{159.0,0.02,51.0,18},{177.0,0.02,51.0,18},{195.0,0.02,51.0,18},{213.0,0.02,51.0,18},{231.0,0.02,51.0,18},{249.0,0.02,51.0,18},{267.0,0.02,51.0,18},{267.0,0.02,69.0,18},{267.0,0.02,81.0,18},{261.0,0.02,81.0,18},{243.0,0.02,81.0,18},{225.0,0.02,81.0,18},{207.0,0.02,81.0,18},{189.0,0.02,81.0,18},{171.0,0.02,81.0,18},{153.0,0.02,81.0,18},{135.0,0.02,81.0,18},{117.0,0.02,81.0,18},{99.0,0.02,81.0,18},{81.0,0.02,81.0,18},{63.0,0.02,81.0,18},{45.0,0.02,81.0,18},{27.0,0.02,81.0,18},{21.0,0.02,81.0,18},{21.0,0.02,93.0,18},{21.0,0.02,111.0,18},{39.0,0.02,111.0,18},{57.0,0.02,111.0,18},{75.0,0.02,111.0,18},{93.0,0.02,111.0,18},{111.0,0.02,111.0,18},{129.0,0.02,111.0,18},{147.0,0.02,111.0,18},{165.0,0.02,111.0,18},{183.0,0.02,111.0,18},{201.0,0.02,111.0,18},{219.0,0.02,111.0,18},{237.0,0.02,111.0,18},{255.0,0.02,111.0,18},{267.0,0.02,111.0,18},{267.0,0.02,117.0,18},{267.0,0.02,135.0,18},{267.0,0.02,141.0,18},{255.0,0.02,141.0,18},{237.0,0.02,141.0,18},{219.0,0.02,141.0,18},{201.0,0.02,141.0,18},{183.0,0.02,141.0,18},{165.0,0.02,141.0,18},{147.0,0.02,141.0,18},{129.0,0.02,141.0,18},{111.0,0.02,141.0,18},{93.0,0.02,141.0,18},{75.0,0.02,141.0,18},{57.0,0.02,141.0,18},{39.0,0.02,141.0,18},{21.0,0.02,141.0,18},{21.0,0.02,159.0,18},{21.0,0.02,171.0,18},{27.0,0.02,171.0,18},{45.0,0.02,171.0,18},{63.0,0.02,171.0,18},{81.0,0.02,171.0,18},{99.0,0.02,171.0,18},{117.0,0.02,171.0,18},{135.0,0.02,171.0,18},{153.0,0.02,171.0,18},{171.0,0.02,171.0,18},{189.0,0.02,171.0,18},{207.0,0.02,171.0,18},{225.0,0.02,171.0,18},{243.0,0.02,171.0,18},{261.0,0.02,171.0,18},{267.0,0.02,171.0,18},{87.0,0.02,63.0,18},{105.0,0.02,63.0,18},{123.0,0.02,63.0,18},{141.0,0.02,63.0,18},{159.0,0.02,63.0,18},{201.0,0.02,153.0,18},{183.0,0.02,153.0,18},{165.0,0.02,153.0,18},{147.0,0.02,153.0,18},{129.0,0.02,153.0,18}}},["caches"]={{{141.0,0.02,27.0},{141.0,0.02,57.0},{141.0,0.02,87.0},{141.0,0.02,117.0},{141.0,0.02,147.0},{141.0,0.02,177.0}},{{147.0,0.02,27.0},{147.0,0.02,57.0},{147.0,0.02,87.0},{147.0,0.02,117.0},{147.0,0.02,147.0},{147.0,0.02,177.0}},{{141.0,0.02,165.0},{141.0,0.02,135.0},{141.0,0.02,105.0},{141.0,0.02,75.0},{141.0,0.02,45.0},{141.0,0.02,15.0}},{{147.0,0.02,27.0},{147.0,0.02,57.0},{147.0,0.02,87.0},{147.0,0.02,117.0},{147.0,0.02,147.0},{147.0,0.02,177.0}},{{141.0,0.02,27.0},{141.0,0.02,57.0},{141.0,0.02,87.0},{141.0,0.02,117.0},{141.0,0.02,147.0},{141.0,0.02,177.0}},{{147.0,0.02,165.0},{147.0,0.02,135.0},{147.0,0.02,105.0},{147.0,0.02,75.0},{147.0,0.02,45.0},{147.0,0.02,15.0}},{{141.0,0.02,27.0},{141.0,0.02,57.0},{141.0,0.02,87.0},{141.0,0.02,117.0},{141.0,0.02,147.0},{141.0,0.02,177.0}},{{147.0,0.02,27.0},{147.0,0.02,57.0},{147.0,0.02,87.0},{147.0,0.02,117.0},{147.0,0.02,147.0},{147.0,0.02,177.0}}},["choices"]={{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={89,90,91,92,93}},{["operation"]=4,["entry"]=64,["exit"]=68,["nodes"]={94,95,96,97,98}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=21,["exit"]=25,["nodes"]={99,100,101,102,103}},{["operation"]=4,["entry"]=71,["exit"]=75,["nodes"]={104,105,106,107,108}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={89,90,91,92,93}},{["operation"]=4,["entry"]=64,["exit"]=68,["nodes"]={94,95,96,97,98}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=21,["exit"]=25,["nodes"]={99,100,101,102,103}},{["operation"]=4,["entry"]=71,["exit"]=75,["nodes"]={104,105,106,107,108}}}},["digital"]={{},{},{},{},{},{},{},{}},["balconies"]={{},{},{},{},{},{},{},{}},["sector_count"]=8}
local day=engine.day
local rules={}
local get,set=engine.get,engine.set
local function body_slot(i)return 32+(i-1)*6 end
local function actor(h)return engine.actor(h)end
local function body(i)return actor(get(body_slot(i)))end
local function inv(h,n)return engine.inventory(h,n)end
local function put(h,n,value)return engine.item(h,n,math.max(0,math.min(999,value))-inv(h,n))end
local function node(n)return engine.node(n)end
local function near(a,b,r)return a and b and (a.x-b.x)^2+(a.y-b.y)^2+(a.z-b.z)^2<r*r end
local function row()return get(19)end
local function sector()return get(61)end
local function finish_node()return cfg.goals[sector()+1][row()+1]end
local function start_node()return row()==0 and 0 or cfg.goals[sector()+1][row()]end
local function final()return sector()==cfg.sector_count-1 and row()==5 end
local function flagged(bit)return get(20)&bit==bit end
local function flag(bit)set(20,get(20)|bit)end
local function goal(n,buttons,line,target,tool)
 set(56,n);set(57,buttons or 2);set(60,line or 1);set(58,target or 0);set(25,tool or -1)
end
local function spawn(kind,n,team,hp,role,owner)
 local p=node(n);if not p then return 0 end
 local x,z=p.x,p.z
 if team==0 then
  if kind==24 then x=x+(role==1 and 2 or -2);z=z+4
  elseif kind==25 then x=x+2;z=z+4
  elseif kind>=26 and kind<=28 then local slot=(role or 0)%500%3;x=x+(slot-1)*5;z=z+5 end
 end
 local h=engine.spawn{x=x,y=p.y,z=z,kind=kind,hp=hp,max_hp=hp,team=team or 0,mode=3,owner=owner or 0,height=kind==3 and 3.5 or 1.6,radius=kind==3 and .8 or .3,speed=cfg.speed}
 if h~=0 then put(h,8,role or 0);put(h,7,team==1 and 1 or 0)end
 return h
end
local function units(team,role)
 local result={}
 for _,h in ipairs(engine.list())do local a=actor(h)
  if a and a.projectile==0 and a.team==team and (not role or inv(h,8)==role)then result[#result+1]=h end
 end
 return result
end
local function count_players(w)
 local n=0;for _,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then n=n+1 end end
 return n
end
local function closest(w,a,team,range,capability)
 local best,h=range*range,0
 for _,candidate in ipairs(units(team))do local target=actor(candidate)
  local d=(target.x-a.x)^2+(target.y-a.y)^2+(target.z-a.z)^2
  if target.hp>0 and (team~=0 or target.kind>=20) and (not capability or capability&inv(candidate,7)~=0) and d<best and visible(a.x,a.z,target.x,target.z)then best,h=d,candidate end
 end
 return h,actor(h)
end
local function launch(h,target,damage,flags,effect,energy,speed)
 local a,b=actor(h),actor(target);if not a or not b then return 0 end
 local dx,dy,dz=b.x-a.x,b.y+b.height*.5-(a.y+a.height*.75),b.z-a.z
 if (flags or 0)&1~=0 then dy=dy+math.sqrt(dx*dx+dz*dz)*.3 end
 put(h,5,flags or 0)
 local shot=engine.projectile(h,dx,dy,dz,speed or 24,damage or 10,energy or 0,0,120)
 put(h,5,0)
 if shot~=0 then put(shot,8,effect or 0)end
 return shot
end
local function interact(p,i,n,r)return p.use~=0 and near(body(i),node(n),r or 3)end
local function shield(h,on)if actor(h)then put(h,11,on and 1 or 0)end end
local function remove_slot(n)if actor(get(n))then engine.remove(get(n))end;set(n,0)end


local mission={alt=true,switch=true,weapons={{damage=24,cooldown=24,ammo=1},{damage=32,cooldown=40,ammo=3,flags=5,effect=6,speed=18},{damage=12,cooldown=24,energy=10}}}
local function nearest(a)
 local best,index=1e12,0
 for j,p in ipairs(cfg.nodes[sector()+1])do local d=(a.x-p[1])^2+(a.y-p[2])^2+(a.z-p[3])^2;if d<best then best,index=d,j-1 end end
 return index
end
function mission.enter(w,p,i)
 local b=body_slot(i);local h=get(b)
 for _,candidate in ipairs(units(0,300))do
  local occupied=false;for j,other in ipairs(w.players)do if j~=i and other.body==candidate then occupied=true end end
  if not occupied and actor(candidate).hp>0 and engine.control(candidate,i-1)then
   if candidate~=h then engine.remove(h);h=candidate;set(b,h);engine.possess(i-1,h);p.body=h end
   break
  end
 end
 put(h,15,5);engine.mode(h,3,0);put(h,13,0);put(h,8,300)
 local squad=units(0,300)
 for j=#squad+1,4 do local ally=spawn(20,start_node(),0,100,300,0);put(ally,15,5);put(ally,1,24);put(ally,2,8);put(ally,13,0)end
end
function mission.prepare(w)
 engine.tactical(1,0,1);for j=1,4 do engine.end_turn()end
 set(26,0);set(27,0);set(31,0);remove_slot(2);set(2,spawn(8,finish_node(),0,1000,90))
 remove_slot(12);remove_slot(13)
 if row()==2 then set(12,spawn(24,finish_node()-2,0,60,270))end
end
function mission.boss_init(w)
 set(12,spawn(9,finish_node()-2,1,40,271));set(13,spawn(9,finish_node()-1,1,40,271))
end
function mission.player(w,p,i,pressed)
 local b=body_slot(i);local h=get(b);local a=body(i)
 if a.order==1 then engine.order(i-1,h,0,a.x,a.y,a.z,0)end
 if pressed&32~=0 then
  local squad=units(0,300);local current=1
  for index,candidate in ipairs(squad)do if candidate==h then current=index end end
  for offset=1,#squad do local candidate=squad[(current+offset-1)%#squad+1];local occupied=false
   for j,other in ipairs(w.players)do if j~=i and other.body==candidate then occupied=true end end
   if not occupied and actor(candidate).hp>0 and engine.control(candidate,i-1)then engine.possess(i-1,candidate);set(b,candidate);p.body=candidate;break end
  end
 end
 if pressed&8~=0 and a.time_units>=10 then
  engine.reaction(h,math.min(20,a.time_units));local target,enemy=closest(w,a,1,18)
  if enemy then engine.order(i-1,h,2,enemy.x,enemy.y,enemy.z,target)end
 end
 if pressed&16~=0 and get(27)==0 then set(26,get(26)|(1<<(i-1)))end
 if p.use~=0 and inv(h,1)==0 and inv(h,2)>0 and engine.tu(h,8)then put(h,1,24);engine.item(h,2,-1)end
 if interact(p,i,finish_node()) and get(27)==0 and engine.tu(h,8)then flag(1);if row()==2 then set(5,get(5)+1)end end
 if row()==2 and interact(p,i,finish_node()-2) and get(27)==0 and not flagged(2) and engine.tu(h,8)then
  flag(2);remove_slot(12);engine.checkpoint(1511+sector())
 end
end
function mission.update(w)
 if get(27)==0 then
  local mask=0;for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then mask=mask|(1<<(i-1))end end
  if mask~=0 and get(26)&mask==mask then engine.end_turn();set(27,1);set(31,0)end
  if w.tick%60==0 then
   local leader=body(1)
   for _,h in ipairs(units(0,300))do local a=actor(h);local occupied=false
    for _,p in ipairs(w.players)do if p.connected==1 and p.body==h then occupied=true end end
    if not occupied and a.hp>0 then
     engine.reaction(h,math.min(20,a.time_units))
     local target,enemy=closest(w,a,1,20)
     if enemy then engine.order(a.owner,h,2,enemy.x,enemy.y,enemy.z,target)
     elseif leader then engine.order(a.owner,h,1,leader.x,leader.y,leader.z,0)end
    end
   end
  end
 elseif w.tick%30==0 then
  local enemies=units(1);local action=get(31);local index=math.floor(action/3)+1;local sub=action%3;set(31,action+1)
  local h=enemies[index];local a=actor(h or 0)
  if a and a.hp>0 then
   local target,other=closest(w,a,0,50)
   if sub==0 then
    local leader=body(1)
    if leader then local from,to=nearest(a),nearest(leader);engine.teleport(h,from+(to>from and 1 or to<from and -1 or 0))end
   elseif sub==1 and other then launch(h,target,4,0,0)
   elseif sub==2 and a.time_units>=10 then
    engine.reaction(h,math.min(20,a.time_units));if other then engine.order(a.owner,h,2,other.x,other.y,other.z,target)end
   end
  end
  if action+1>=#enemies*3 then for j=1,3 do engine.end_turn()end;set(27,0);set(26,0);set(14,get(14)+1)end
 end
 if row()==2 and not flagged(2)then
  local civilian=actor(get(12));if civilian and civilian.hp==0 then engine.heal(get(12),60,0)end
  goal(finish_node()-2,2,3)
 end
end
function mission.ready(w)return flagged(1) and (row()~=2 or flagged(2))end
function mission.boss(w)
 for _,slot in ipairs({12,13})do local conduit=actor(get(slot))
  if conduit and conduit.hp>0 then shield(get(1),true);goal(finish_node()-(slot==12 and 2 or 1),1,3,get(slot),0);return end
 end
 shield(get(1),not flagged(1))
 if flagged(1)then
  local a=actor(get(1));local leader=body(1)
  if a and a.visible&1~=0 then goal(nearest(a),1,4,get(1),0)
  elseif leader then goal(math.max(start_node(),nearest(leader)-1),2,14)end
 else goal(finish_node(),2,3)end
end

local function enter(w,p,i)
 local b=body_slot(i);local h=get(b);local a=actor(h)
 if not a then
  h=spawn(20,get(18),0,100,0,i-1);if h==0 then return end
  set(b,h);engine.mode(h,0,cfg.speed);put(h,0,3);put(h,1,48);put(h,2,24);put(h,3,10);put(h,9,12);put(h,12,i-1);put(h,6,1);put(h,7,1)
 end
 engine.possess(i-1,h);p.body,p.zone,p.eligible=h,1,w.won==0 and 1 or 0
 if mission.enter then mission.enter(w,p,i)end
end
local function leave(p,i)
 local h=get(body_slot(i));engine.possess(i-1,0);engine.remove(h);set(body_slot(i),0)
 p.body,p.zone,p.x,p.y,p.z,p.hp=0,0,12,0,5,100
end
local function prepare(w)
 set(0,1);set(20,0);set(18,start_node());set(15,get(15)+1)
 local first,last=start_node(),finish_node();local size=9+math.max(0,count_players(w)-1)*2
 if get(11)&(1<<row())==0 then
  local p=cfg.caches[sector()+1][row()+1]
  local cache=engine.spawn{x=p[1],y=p[2],z=p[3],kind=6,team=0,mode=3,hp=1000,max_hp=1000}
  put(cache,8,460);put(cache,4,row())
 end
 for j=1,size do
  local n=math.floor(first+(last-first)*(.18+.75*(j-1)/math.max(1,size-1)))
  local kind=j%4==0 and 2 or 1
  local h=spawn(kind,n,1,kind==2 and 64 or 30+sector()*2,100+row())
  if actor(h)then put(h,4,n)end
  if day==13 and actor(h)then put(h,5,2)end
  if day==24 and actor(h)then put(h,12,j%2)end
 end
 if mission.prepare then mission.prepare(w)end
 if final()then
  set(1,spawn(3,finish_node(),1,360+count_players(w)*60,200));shield(get(1),true)
  if mission.boss_init then mission.boss_init(w)end
 end
 goal(finish_node(),2,1)
 engine.checkpoint(1000+sector()*10+row())
end
local function fire(w,p,i)
 local b=body_slot(i);local h=get(b);local a=actor(h);local kit=inv(h,13)%3;local weapon=mission.weapons[kit+1]
 if p.fire==0 or w.tick<get(b+1)then return end
 local damage=weapon.damage
 if mission.fire then local value=mission.fire(w,p,i,kit,weapon);if value~=nil then damage=value end end
 if not damage or damage<=0 then return end
 local ammo=weapon.ammo or 0
 if ammo>0 and inv(h,ammo)==0 and kit~=0 then return end
 local melee=weapon.melee or ammo>0 and inv(h,ammo)==0
 local target,enemy=closest(w,a,1,melee and 2.8 or 60)
 local success=false
 if melee then
  if enemy then success=engine.damage(target,h,ammo>0 and inv(h,ammo)==0 and 8 or damage)end
 else
  local yaw,pitch=p.yaw,p.pitch
  local flags=weapon.flags or 0;put(h,5,flags)
  local shot=engine.projectile(h,math.sin(yaw)*math.cos(pitch),math.sin(pitch)+(flags&1~=0 and .32 or 0),-math.cos(yaw)*math.cos(pitch),weapon.speed or 32,damage,weapon.energy or 0,0,flags&1~=0 and 180 or 90)
  put(h,5,0);success=shot~=0
  if success then put(shot,8,weapon.effect or 0)end
 end
 if success then
  if mission.fired then mission.fired(w,p,i,kit)end
  if ammo>0 and inv(h,ammo)>0 then engine.item(h,ammo,-1)end
  set(b+1,w.tick+weapon.cooldown);p.cooldown=weapon.cooldown
 end
end
local function player(w,p,i)
 local b=body_slot(i);local h=get(b);local a=actor(h)
 if not a then enter(w,p,i);return end
 if a.hp==0 then
  if p.respawn==0 then p.respawn=w.tick+240 end
  if w.tick>=p.respawn then engine.heal(h,100,100);engine.teleport(h,get(18));p.respawn=0;put(h,1,math.max(12,inv(h,1)));set(b+2,0)end
  return
 end
 local buttons=(p.use~=0 and 2 or 0)|(p.jump~=0 and 4 or 0)|(p.alt~=0 and 8 or 0)|(p.command~=0 and 16 or 0)|(p.next~=0 and 32 or 0)
 local pressed=buttons&~get(b+2);set(b+2,buttons)
 if pressed&32~=0 and not mission.switch then put(h,13,(inv(h,13)+1)%3)end
 if inv(h,10)==999 and w.tick>get(b+4)then put(h,10,0)end
 if mission.player then mission.player(w,p,i,pressed)end
 if p.use~=0 then for _,cache in ipairs(units(0,460))do
  if near(a,actor(cache),3)then
   put(h,1,inv(h,1)+12);put(h,2,inv(h,2)+6);put(h,3,inv(h,3)+2);engine.heal(h,30,30)
   set(11,get(11)|(1<<inv(cache,4)));engine.remove(cache)
  end
 end end
 if pressed&8~=0 and not mission.alt and inv(h,0)>0 and a.hp<70 then engine.item(h,0,-1);engine.heal(h,40,0)end
 fire(w,p,i)
 if w.won==1 and interact(p,i,finish_node(),5)then leave(p,i)end
end
local function enemies(w)
 local guards=0
 for _,h in ipairs(units(1))do local a=actor(h);local role=inv(h,8)
  if role>=100 and role<106 then
   if a.hp==0 then
    local collected=false
    for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 and near(body(i),a,7)then
     local ph=get(body_slot(i));put(ph,1,inv(ph,1)+2);if a.kind==2 then put(ph,2,inv(ph,2)+1)end;collected=true
    end end
    if collected then engine.remove(h);set(17,get(17)+1)end
   else
    guards=guards+1
    local target,other=closest(w,a,0,36)
    if day==13 and a.order_target~=0 then local angry=actor(a.order_target);if angry and angry.hp>0 then target,other=a.order_target,angry end end
    if day~=15 and other and not (day==24 and a.kind==2 and get(8)&(1<<inv(h,12))~=0) and w.tick%120==h%120 then launch(h,target,a.kind==2 and 5 or 3,day==13 and 2 or 0,0,0,18)end
   end
  end
 end
 local boss=actor(get(1))
 if day~=15 and boss and boss.hp>0 and final()then
  local target,other=closest(w,boss,0,46)
  if other and w.tick%120==0 then
   launch(get(1),target,9,day==13 and 2 or 0)
   if day==13 and get(21)>0 then launch(get(1),target,8,2,0,0,16)end
  end
 end
 return guards
end
local function regrouped(w)
 local exit=node(finish_node());local active=false
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local a=body(i)
  if a and a.hp>0 then active=true;if not near(a,exit,8)then return false end end
 end end
 return active
end
function rules.init(w)
 if not engine.reset(202600+day)then return w end
 w.keys,w.valves,w.phase,w.won=0,0,0,0
 set(63,100+day);set(25,-1);set(61,0);set(62,0);set(19,0);set(18,0)
 engine.team(0,24,24,12)
 if mission.init then mission.init(w)end
 goal(cfg.goals[1][1],2,0)
 return w
end
function rules.step(w)
 local active,input=false,false
 for i,p in ipairs(w.players)do if p.connected==1 then
  if p.zone==0 then
   if p.use~=0 and p.portal==day and w.unlocked>=day then
    if w.won==1 then rules.init(w)end
    enter(w,p,i)
   end
  else
   active=true
   if p.hp>0 and (p.forward~=0 or p.strafe~=0 or p.vertical~=0 or p.use~=0 or p.fire~=0 or p.alt~=0 or p.command~=0 or p.jump~=0)then input=true end
   player(w,p,i)
  end
 end end
 if not active then return w end
 if input or day==15 and get(27)==1 then set(62,get(62)+1)end
 if w.won==1 then goal(finish_node(),2,6);return w end
 if get(0)==0 then prepare(w)end
 goal(finish_node(),2,1)
 if mission.update then mission.update(w)end
 set(59,get(20))
 local guards=enemies(w)
 if guards>0 and day~=15 and get(56)==finish_node()then
  for _,h in ipairs(units(1,100+row()))do
   if actor(h).hp>0 then goal(inv(h,4),1,1,h,0);break end
  end
 end
 local ready=mission.ready(w)
 if final() and ready and mission.boss then mission.boss(w)end
 if final() and actor(get(1)) and actor(get(1)).hp>0 then return w end
 if guards~=0 or not ready then return w end
 if row()<5 then
  set(23,get(23)+1);set(19,row()+1);set(0,0);set(21,0);set(22,0)
 else
  goal(finish_node(),2,5)
  local used=false;for i,p in ipairs(w.players)do if interact(p,i,finish_node(),5)then used=true end end
  if used and regrouped(w)then
   set(23,get(23)+1)
   if sector()+1<cfg.sector_count then
    if engine.travel(sector()+1)then set(19,0);set(18,0);set(0,0);set(4,0);set(8,0);set(11,0);set(21,0);set(22,0);set(26,0);set(27,0);if mission.travel then mission.travel(w)end end
   else w.won,w.phase=1,3;engine.complete(day);engine.checkpoint(2000+day);goal(finish_node(),2,6)end
  else set(60,15)end
 end
 return w
end
function rules.migrate(w)return w end
return rules
