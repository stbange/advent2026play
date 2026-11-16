-- SPDX-License-Identifier: MIT
-- Editable campaign source. All durable progress belongs to engine state and actor inventories.
local cfg={["day"]=21,["id"]="first-kingdom",["title"]="First Kingdom",["reference"]="Age of Empires",["boss"]="The River King attacks with a siege tower, archers, and escorts. Spearmen hold the approach while archers strike exposed engineers. After the tower falls, the king dismounts behind a shield line; flank through a route opened by the player’s earlier construction choice.",["concept_art"]={["exploration"]="art/concepts/21-first-kingdom-exploration.png",["finale"]="art/concepts/21-first-kingdom-finale.png"},["sectors"]={"River camp","Woodland frontier","Granary reach","Stone terrace","Bronze crossing","River siege"},["palette"]={"#806b45","#dcc18b","#699357"},["speed"]=4.5,["mode"]="kingdom",["cell_metres"]=6,["target_minutes"]={["solo"]={35,60},["cooperative"]={30,55}},["pacing_status"]="authored target; ordinary-input and human timing qualification required",["goals"]={{13,28,43,58,73,88},{13,29,46,61,77,94},{13,29,46,61,77,94},{14,31,48,64,81,98},{13,28,43,58,73,88},{13,29,46,61,77,94}},["nodes"]={{{33.0,0.02,21.0,1},{51.0,0.02,21.0,1},{69.0,0.02,21.0,1},{87.0,0.02,21.0,1},{105.0,0.02,21.0,1},{123.0,0.02,21.0,1},{141.0,0.02,21.0,1},{159.0,0.02,21.0,1},{177.0,0.02,21.0,1},{195.0,0.02,21.0,1},{213.0,0.02,21.0,1},{231.0,0.02,21.0,1},{249.0,0.02,21.0,1},{255.0,0.02,21.0,1},{255.0,0.02,33.0,1},{255.0,0.02,51.0,1},{237.0,0.02,51.0,1},{219.0,0.02,51.0,1},{201.0,0.02,51.0,1},{183.0,0.02,51.0,1},{165.0,0.02,51.0,1},{147.0,0.02,51.0,1},{129.0,0.02,51.0,1},{111.0,0.02,51.0,1},{93.0,0.02,51.0,1},{75.0,0.02,51.0,1},{57.0,0.02,51.0,1},{39.0,0.02,51.0,1},{33.0,0.02,51.0,1},{33.0,0.02,63.0,1},{33.0,0.02,81.0,1},{51.0,0.02,81.0,1},{69.0,0.02,81.0,1},{87.0,0.02,81.0,1},{105.0,0.02,81.0,1},{123.0,0.02,81.0,1},{141.0,0.02,81.0,1},{159.0,0.02,81.0,1},{177.0,0.02,81.0,1},{195.0,0.02,81.0,1},{213.0,0.02,81.0,1},{231.0,0.02,81.0,1},{249.0,0.02,81.0,1},{255.0,0.02,81.0,1},{255.0,0.02,93.0,1},{255.0,0.02,111.0,1},{237.0,0.02,111.0,1},{219.0,0.02,111.0,1},{201.0,0.02,111.0,1},{183.0,0.02,111.0,1},{165.0,0.02,111.0,1},{147.0,0.02,111.0,1},{129.0,0.02,111.0,1},{111.0,0.02,111.0,1},{93.0,0.02,111.0,1},{75.0,0.02,111.0,1},{57.0,0.02,111.0,1},{39.0,0.02,111.0,1},{33.0,0.02,111.0,1},{33.0,0.02,123.0,1},{33.0,0.02,141.0,1},{51.0,0.02,141.0,1},{69.0,0.02,141.0,1},{87.0,0.02,141.0,1},{105.0,0.02,141.0,1},{123.0,0.02,141.0,1},{141.0,0.02,141.0,1},{159.0,0.02,141.0,1},{177.0,0.02,141.0,1},{195.0,0.02,141.0,1},{213.0,0.02,141.0,1},{231.0,0.02,141.0,1},{249.0,0.02,141.0,1},{255.0,0.02,141.0,1},{255.0,0.02,153.0,1},{255.0,0.02,171.0,1},{237.0,0.02,171.0,1},{219.0,0.02,171.0,1},{201.0,0.02,171.0,1},{183.0,0.02,171.0,1},{165.0,0.02,171.0,1},{147.0,0.02,171.0,1},{129.0,0.02,171.0,1},{111.0,0.02,171.0,1},{93.0,0.02,171.0,1},{75.0,0.02,171.0,1},{57.0,0.02,171.0,1},{39.0,0.02,171.0,1},{33.0,0.02,171.0,1},{183.0,0.02,63.0,2},{165.0,0.02,63.0,2},{147.0,0.02,63.0,2},{129.0,0.02,63.0,2},{111.0,0.02,63.0,2},{105.0,0.02,153.0,2},{123.0,0.02,153.0,2},{141.0,0.02,153.0,2},{159.0,0.02,153.0,2},{177.0,0.02,153.0,2}},{{267.0,0.02,21.0,1},{249.0,0.02,21.0,1},{231.0,0.02,21.0,1},{213.0,0.02,21.0,1},{195.0,0.02,21.0,1},{177.0,0.02,21.0,1},{159.0,0.02,21.0,1},{141.0,0.02,21.0,1},{123.0,0.02,21.0,1},{105.0,0.02,21.0,1},{87.0,0.02,21.0,1},{69.0,0.02,21.0,1},{51.0,0.02,21.0,1},{33.0,0.02,21.0,1},{33.0,0.02,39.0,1},{33.0,0.02,51.0,1},{39.0,0.02,51.0,1},{57.0,0.02,51.0,1},{75.0,0.02,51.0,1},{93.0,0.02,51.0,1},{111.0,0.02,51.0,1},{129.0,0.02,51.0,1},{147.0,0.02,51.0,1},{165.0,0.02,51.0,1},{183.0,0.02,51.0,1},{201.0,0.02,51.0,1},{219.0,0.02,51.0,1},{237.0,0.02,51.0,1},{255.0,0.02,51.0,1},{267.0,0.02,51.0,1},{267.0,0.02,57.0,1},{267.0,0.02,75.0,1},{267.0,0.02,81.0,1},{255.0,0.02,81.0,1},{237.0,0.02,81.0,1},{219.0,0.02,81.0,1},{201.0,0.02,81.0,1},{183.0,0.02,81.0,1},{165.0,0.02,81.0,1},{147.0,0.02,81.0,1},{129.0,0.02,81.0,1},{111.0,0.02,81.0,1},{93.0,0.02,81.0,1},{75.0,0.02,81.0,1},{57.0,0.02,81.0,1},{39.0,0.02,81.0,1},{33.0,0.02,81.0,1},{33.0,0.02,93.0,1},{33.0,0.02,111.0,1},{51.0,0.02,111.0,1},{69.0,0.02,111.0,1},{87.0,0.02,111.0,1},{105.0,0.02,111.0,1},{123.0,0.02,111.0,1},{141.0,0.02,111.0,1},{159.0,0.02,111.0,1},{177.0,0.02,111.0,1},{195.0,0.02,111.0,1},{213.0,0.02,111.0,1},{231.0,0.02,111.0,1},{249.0,0.02,111.0,1},{267.0,0.02,111.0,1},{267.0,0.02,129.0,1},{267.0,0.02,141.0,1},{261.0,0.02,141.0,1},{243.0,0.02,141.0,1},{225.0,0.02,141.0,1},{207.0,0.02,141.0,1},{189.0,0.02,141.0,1},{171.0,0.02,141.0,1},{153.0,0.02,141.0,1},{135.0,0.02,141.0,1},{117.0,0.02,141.0,1},{99.0,0.02,141.0,1},{81.0,0.02,141.0,1},{63.0,0.02,141.0,1},{45.0,0.02,141.0,1},{33.0,0.02,141.0,1},{33.0,0.02,147.0,1},{33.0,0.02,165.0,1},{33.0,0.02,171.0,1},{45.0,0.02,171.0,1},{63.0,0.02,171.0,1},{81.0,0.02,171.0,1},{99.0,0.02,171.0,1},{117.0,0.02,171.0,1},{135.0,0.02,171.0,1},{153.0,0.02,171.0,1},{171.0,0.02,171.0,1},{189.0,0.02,171.0,1},{207.0,0.02,171.0,1},{225.0,0.02,171.0,1},{243.0,0.02,171.0,1},{261.0,0.02,171.0,1},{267.0,0.02,171.0,1},{93.0,0.02,63.0,2},{111.0,0.02,63.0,2},{129.0,0.02,63.0,2},{147.0,0.02,63.0,2},{165.0,0.02,63.0,2},{207.0,0.02,153.0,2},{189.0,0.02,153.0,2},{171.0,0.02,153.0,2},{153.0,0.02,153.0,2},{135.0,0.02,153.0,2}},{{33.0,0.02,171.0,1},{51.0,0.02,171.0,1},{69.0,0.02,171.0,1},{87.0,0.02,171.0,1},{105.0,0.02,171.0,1},{123.0,0.02,171.0,1},{141.0,0.02,171.0,1},{159.0,0.02,171.0,1},{177.0,0.02,171.0,1},{195.0,0.02,171.0,1},{213.0,0.02,171.0,1},{231.0,0.02,171.0,1},{249.0,0.02,171.0,1},{267.0,0.02,171.0,1},{267.0,0.02,153.0,1},{267.0,0.02,141.0,1},{261.0,0.02,141.0,1},{243.0,0.02,141.0,1},{225.0,0.02,141.0,1},{207.0,0.02,141.0,1},{189.0,0.02,141.0,1},{171.0,0.02,141.0,1},{153.0,0.02,141.0,1},{135.0,0.02,141.0,1},{117.0,0.02,141.0,1},{99.0,0.02,141.0,1},{81.0,0.02,141.0,1},{63.0,0.02,141.0,1},{45.0,0.02,141.0,1},{33.0,0.02,141.0,1},{33.0,0.02,135.0,1},{33.0,0.02,117.0,1},{33.0,0.02,111.0,1},{45.0,0.02,111.0,1},{63.0,0.02,111.0,1},{81.0,0.02,111.0,1},{99.0,0.02,111.0,1},{117.0,0.02,111.0,1},{135.0,0.02,111.0,1},{153.0,0.02,111.0,1},{171.0,0.02,111.0,1},{189.0,0.02,111.0,1},{207.0,0.02,111.0,1},{225.0,0.02,111.0,1},{243.0,0.02,111.0,1},{261.0,0.02,111.0,1},{267.0,0.02,111.0,1},{267.0,0.02,99.0,1},{267.0,0.02,81.0,1},{249.0,0.02,81.0,1},{231.0,0.02,81.0,1},{213.0,0.02,81.0,1},{195.0,0.02,81.0,1},{177.0,0.02,81.0,1},{159.0,0.02,81.0,1},{141.0,0.02,81.0,1},{123.0,0.02,81.0,1},{105.0,0.02,81.0,1},{87.0,0.02,81.0,1},{69.0,0.02,81.0,1},{51.0,0.02,81.0,1},{33.0,0.02,81.0,1},{33.0,0.02,63.0,1},{33.0,0.02,51.0,1},{39.0,0.02,51.0,1},{57.0,0.02,51.0,1},{75.0,0.02,51.0,1},{93.0,0.02,51.0,1},{111.0,0.02,51.0,1},{129.0,0.02,51.0,1},{147.0,0.02,51.0,1},{165.0,0.02,51.0,1},{183.0,0.02,51.0,1},{201.0,0.02,51.0,1},{219.0,0.02,51.0,1},{237.0,0.02,51.0,1},{255.0,0.02,51.0,1},{267.0,0.02,51.0,1},{267.0,0.02,45.0,1},{267.0,0.02,27.0,1},{267.0,0.02,21.0,1},{255.0,0.02,21.0,1},{237.0,0.02,21.0,1},{219.0,0.02,21.0,1},{201.0,0.02,21.0,1},{183.0,0.02,21.0,1},{165.0,0.02,21.0,1},{147.0,0.02,21.0,1},{129.0,0.02,21.0,1},{111.0,0.02,21.0,1},{93.0,0.02,21.0,1},{75.0,0.02,21.0,1},{57.0,0.02,21.0,1},{39.0,0.02,21.0,1},{33.0,0.02,21.0,1},{207.0,0.02,129.0,2},{189.0,0.02,129.0,2},{171.0,0.02,129.0,2},{153.0,0.02,129.0,2},{135.0,0.02,129.0,2},{93.0,0.02,39.0,2},{111.0,0.02,39.0,2},{129.0,0.02,39.0,2},{147.0,0.02,39.0,2},{165.0,0.02,39.0,2}},{{267.0,0.02,21.0,1},{249.0,0.02,21.0,1},{231.0,0.02,21.0,1},{213.0,0.02,21.0,1},{195.0,0.02,21.0,1},{177.0,0.02,21.0,1},{159.0,0.02,21.0,1},{141.0,0.02,21.0,1},{123.0,0.02,21.0,1},{105.0,0.02,21.0,1},{87.0,0.02,21.0,1},{69.0,0.02,21.0,1},{51.0,0.02,21.0,1},{33.0,0.02,21.0,1},{21.0,0.02,21.0,1},{21.0,0.02,27.0,1},{21.0,0.02,45.0,1},{21.0,0.02,51.0,1},{33.0,0.02,51.0,1},{51.0,0.02,51.0,1},{69.0,0.02,51.0,1},{87.0,0.02,51.0,1},{105.0,0.02,51.0,1},{123.0,0.02,51.0,1},{141.0,0.02,51.0,1},{159.0,0.02,51.0,1},{177.0,0.02,51.0,1},{195.0,0.02,51.0,1},{213.0,0.02,51.0,1},{231.0,0.02,51.0,1},{249.0,0.02,51.0,1},{267.0,0.02,51.0,1},{267.0,0.02,69.0,1},{267.0,0.02,81.0,1},{261.0,0.02,81.0,1},{243.0,0.02,81.0,1},{225.0,0.02,81.0,1},{207.0,0.02,81.0,1},{189.0,0.02,81.0,1},{171.0,0.02,81.0,1},{153.0,0.02,81.0,1},{135.0,0.02,81.0,1},{117.0,0.02,81.0,1},{99.0,0.02,81.0,1},{81.0,0.02,81.0,1},{63.0,0.02,81.0,1},{45.0,0.02,81.0,1},{27.0,0.02,81.0,1},{21.0,0.02,81.0,1},{21.0,0.02,93.0,1},{21.0,0.02,111.0,1},{39.0,0.02,111.0,1},{57.0,0.02,111.0,1},{75.0,0.02,111.0,1},{93.0,0.02,111.0,1},{111.0,0.02,111.0,1},{129.0,0.02,111.0,1},{147.0,0.02,111.0,1},{165.0,0.02,111.0,1},{183.0,0.02,111.0,1},{201.0,0.02,111.0,1},{219.0,0.02,111.0,1},{237.0,0.02,111.0,1},{255.0,0.02,111.0,1},{267.0,0.02,111.0,1},{267.0,0.02,117.0,1},{267.0,0.02,135.0,1},{267.0,0.02,141.0,1},{255.0,0.02,141.0,1},{237.0,0.02,141.0,1},{219.0,0.02,141.0,1},{201.0,0.02,141.0,1},{183.0,0.02,141.0,1},{165.0,0.02,141.0,1},{147.0,0.02,141.0,1},{129.0,0.02,141.0,1},{111.0,0.02,141.0,1},{93.0,0.02,141.0,1},{75.0,0.02,141.0,1},{57.0,0.02,141.0,1},{39.0,0.02,141.0,1},{21.0,0.02,141.0,1},{21.0,0.02,159.0,1},{21.0,0.02,171.0,1},{27.0,0.02,171.0,1},{45.0,0.02,171.0,1},{63.0,0.02,171.0,1},{81.0,0.02,171.0,1},{99.0,0.02,171.0,1},{117.0,0.02,171.0,1},{135.0,0.02,171.0,1},{153.0,0.02,171.0,1},{171.0,0.02,171.0,1},{189.0,0.02,171.0,1},{207.0,0.02,171.0,1},{225.0,0.02,171.0,1},{243.0,0.02,171.0,1},{261.0,0.02,171.0,1},{267.0,0.02,171.0,1},{87.0,0.02,63.0,2},{105.0,0.02,63.0,2},{123.0,0.02,63.0,2},{141.0,0.02,63.0,2},{159.0,0.02,63.0,2},{201.0,0.02,153.0,2},{183.0,0.02,153.0,2},{165.0,0.02,153.0,2},{147.0,0.02,153.0,2},{129.0,0.02,153.0,2}},{{33.0,0.02,21.0,1},{51.0,0.02,21.0,1},{69.0,0.02,21.0,1},{87.0,0.02,21.0,1},{105.0,0.02,21.0,1},{123.0,0.02,21.0,1},{141.0,0.02,21.0,1},{159.0,0.02,21.0,1},{177.0,0.02,21.0,1},{195.0,0.02,21.0,1},{213.0,0.02,21.0,1},{231.0,0.02,21.0,1},{249.0,0.02,21.0,1},{255.0,0.02,21.0,1},{255.0,0.02,33.0,1},{255.0,0.02,51.0,1},{237.0,0.02,51.0,1},{219.0,0.02,51.0,1},{201.0,0.02,51.0,1},{183.0,0.02,51.0,1},{165.0,0.02,51.0,1},{147.0,0.02,51.0,1},{129.0,0.02,51.0,1},{111.0,0.02,51.0,1},{93.0,0.02,51.0,1},{75.0,0.02,51.0,1},{57.0,0.02,51.0,1},{39.0,0.02,51.0,1},{33.0,0.02,51.0,1},{33.0,0.02,63.0,1},{33.0,0.02,81.0,1},{51.0,0.02,81.0,1},{69.0,0.02,81.0,1},{87.0,0.02,81.0,1},{105.0,0.02,81.0,1},{123.0,0.02,81.0,1},{141.0,0.02,81.0,1},{159.0,0.02,81.0,1},{177.0,0.02,81.0,1},{195.0,0.02,81.0,1},{213.0,0.02,81.0,1},{231.0,0.02,81.0,1},{249.0,0.02,81.0,1},{255.0,0.02,81.0,1},{255.0,0.02,93.0,1},{255.0,0.02,111.0,1},{237.0,0.02,111.0,1},{219.0,0.02,111.0,1},{201.0,0.02,111.0,1},{183.0,0.02,111.0,1},{165.0,0.02,111.0,1},{147.0,0.02,111.0,1},{129.0,0.02,111.0,1},{111.0,0.02,111.0,1},{93.0,0.02,111.0,1},{75.0,0.02,111.0,1},{57.0,0.02,111.0,1},{39.0,0.02,111.0,1},{33.0,0.02,111.0,1},{33.0,0.02,123.0,1},{33.0,0.02,141.0,1},{51.0,0.02,141.0,1},{69.0,0.02,141.0,1},{87.0,0.02,141.0,1},{105.0,0.02,141.0,1},{123.0,0.02,141.0,1},{141.0,0.02,141.0,1},{159.0,0.02,141.0,1},{177.0,0.02,141.0,1},{195.0,0.02,141.0,1},{213.0,0.02,141.0,1},{231.0,0.02,141.0,1},{249.0,0.02,141.0,1},{255.0,0.02,141.0,1},{255.0,0.02,153.0,1},{255.0,0.02,171.0,1},{237.0,0.02,171.0,1},{219.0,0.02,171.0,1},{201.0,0.02,171.0,1},{183.0,0.02,171.0,1},{165.0,0.02,171.0,1},{147.0,0.02,171.0,1},{129.0,0.02,171.0,1},{111.0,0.02,171.0,1},{93.0,0.02,171.0,1},{75.0,0.02,171.0,1},{57.0,0.02,171.0,1},{39.0,0.02,171.0,1},{33.0,0.02,171.0,1},{183.0,0.02,63.0,2},{165.0,0.02,63.0,2},{147.0,0.02,63.0,2},{129.0,0.02,63.0,2},{111.0,0.02,63.0,2},{105.0,0.02,153.0,2},{123.0,0.02,153.0,2},{141.0,0.02,153.0,2},{159.0,0.02,153.0,2},{177.0,0.02,153.0,2}},{{267.0,0.02,171.0,1},{249.0,0.02,171.0,1},{231.0,0.02,171.0,1},{213.0,0.02,171.0,1},{195.0,0.02,171.0,1},{177.0,0.02,171.0,1},{159.0,0.02,171.0,1},{141.0,0.02,171.0,1},{123.0,0.02,171.0,1},{105.0,0.02,171.0,1},{87.0,0.02,171.0,1},{69.0,0.02,171.0,1},{51.0,0.02,171.0,1},{33.0,0.02,171.0,1},{33.0,0.02,153.0,1},{33.0,0.02,141.0,1},{39.0,0.02,141.0,1},{57.0,0.02,141.0,1},{75.0,0.02,141.0,1},{93.0,0.02,141.0,1},{111.0,0.02,141.0,1},{129.0,0.02,141.0,1},{147.0,0.02,141.0,1},{165.0,0.02,141.0,1},{183.0,0.02,141.0,1},{201.0,0.02,141.0,1},{219.0,0.02,141.0,1},{237.0,0.02,141.0,1},{255.0,0.02,141.0,1},{267.0,0.02,141.0,1},{267.0,0.02,135.0,1},{267.0,0.02,117.0,1},{267.0,0.02,111.0,1},{255.0,0.02,111.0,1},{237.0,0.02,111.0,1},{219.0,0.02,111.0,1},{201.0,0.02,111.0,1},{183.0,0.02,111.0,1},{165.0,0.02,111.0,1},{147.0,0.02,111.0,1},{129.0,0.02,111.0,1},{111.0,0.02,111.0,1},{93.0,0.02,111.0,1},{75.0,0.02,111.0,1},{57.0,0.02,111.0,1},{39.0,0.02,111.0,1},{33.0,0.02,111.0,1},{33.0,0.02,99.0,1},{33.0,0.02,81.0,1},{51.0,0.02,81.0,1},{69.0,0.02,81.0,1},{87.0,0.02,81.0,1},{105.0,0.02,81.0,1},{123.0,0.02,81.0,1},{141.0,0.02,81.0,1},{159.0,0.02,81.0,1},{177.0,0.02,81.0,1},{195.0,0.02,81.0,1},{213.0,0.02,81.0,1},{231.0,0.02,81.0,1},{249.0,0.02,81.0,1},{267.0,0.02,81.0,1},{267.0,0.02,63.0,1},{267.0,0.02,51.0,1},{261.0,0.02,51.0,1},{243.0,0.02,51.0,1},{225.0,0.02,51.0,1},{207.0,0.02,51.0,1},{189.0,0.02,51.0,1},{171.0,0.02,51.0,1},{153.0,0.02,51.0,1},{135.0,0.02,51.0,1},{117.0,0.02,51.0,1},{99.0,0.02,51.0,1},{81.0,0.02,51.0,1},{63.0,0.02,51.0,1},{45.0,0.02,51.0,1},{33.0,0.02,51.0,1},{33.0,0.02,45.0,1},{33.0,0.02,27.0,1},{33.0,0.02,21.0,1},{45.0,0.02,21.0,1},{63.0,0.02,21.0,1},{81.0,0.02,21.0,1},{99.0,0.02,21.0,1},{117.0,0.02,21.0,1},{135.0,0.02,21.0,1},{153.0,0.02,21.0,1},{171.0,0.02,21.0,1},{189.0,0.02,21.0,1},{207.0,0.02,21.0,1},{225.0,0.02,21.0,1},{243.0,0.02,21.0,1},{261.0,0.02,21.0,1},{267.0,0.02,21.0,1},{93.0,0.02,129.0,2},{111.0,0.02,129.0,2},{129.0,0.02,129.0,2},{147.0,0.02,129.0,2},{165.0,0.02,129.0,2},{207.0,0.02,39.0,2},{189.0,0.02,39.0,2},{171.0,0.02,39.0,2},{153.0,0.02,39.0,2},{135.0,0.02,39.0,2}}},["caches"]={{{141.0,0.02,27.0},{141.0,0.02,57.0},{141.0,0.02,87.0},{141.0,0.02,117.0},{141.0,0.02,147.0},{141.0,0.02,177.0}},{{147.0,0.02,27.0},{147.0,0.02,57.0},{147.0,0.02,87.0},{147.0,0.02,117.0},{147.0,0.02,147.0},{147.0,0.02,177.0}},{{141.0,0.02,165.0},{141.0,0.02,135.0},{141.0,0.02,105.0},{141.0,0.02,75.0},{141.0,0.02,45.0},{141.0,0.02,15.0}},{{147.0,0.02,27.0},{147.0,0.02,57.0},{147.0,0.02,87.0},{147.0,0.02,117.0},{147.0,0.02,147.0},{147.0,0.02,177.0}},{{141.0,0.02,27.0},{141.0,0.02,57.0},{141.0,0.02,87.0},{141.0,0.02,117.0},{141.0,0.02,147.0},{141.0,0.02,177.0}},{{147.0,0.02,165.0},{147.0,0.02,135.0},{147.0,0.02,105.0},{147.0,0.02,75.0},{147.0,0.02,45.0},{147.0,0.02,15.0}}},["choices"]={{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={89,90,91,92,93}},{["operation"]=4,["entry"]=64,["exit"]=68,["nodes"]={94,95,96,97,98}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}},{{["operation"]=1,["entry"]=21,["exit"]=25,["nodes"]={99,100,101,102,103}},{["operation"]=4,["entry"]=71,["exit"]=75,["nodes"]={104,105,106,107,108}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={89,90,91,92,93}},{["operation"]=4,["entry"]=64,["exit"]=68,["nodes"]={94,95,96,97,98}}},{{["operation"]=1,["entry"]=19,["exit"]=23,["nodes"]={95,96,97,98,99}},{["operation"]=4,["entry"]=67,["exit"]=71,["nodes"]={100,101,102,103,104}}}},["digital"]={{},{},{},{},{},{}},["balconies"]={{},{},{},{},{},{}},["sector_count"]=6}
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
local function purchase(price,power,supply)
 if not engine.reserve(0,price)then return false end
 if engine.purchase(0,price,power or 0,supply or 0)then return true end
 engine.release(0,price);return false
end

local function resource(kind,position)
 local p=node(position);local h=engine.spawn{x=p.x+2,y=p.y,z=p.z,kind=4,team=0,mode=3,hp=1000,max_hp=1000,carried=120,height=1,radius=.4}
 put(h,8,400+kind);return h
end

local function base_resources()
 local result={};for _,h in ipairs(units(0))do local role=inv(h,8);if role>=401 and role<=403 then result[role-400]=h end end;return result
end

local function workers(amount)
 local group=units(0,4)
 for j=#group+1,amount do local h=spawn(25,start_node(),0,80,4,0);engine.mode(h,0,5);put(h,12,(j-1)%3+1)end
end

local function harvest(w,types)
 if w.tick%30~=0 then return end
 local sources=base_resources();local home=node(start_node())
 for _,h in ipairs(units(0,4))do local a=actor(h);local kind=(inv(h,12)-1)%types+1;local source=sources[kind];local patch=actor(source or 0)
  local best=1e20
  for _,candidate in ipairs(units(0,400+kind))do local available=actor(candidate);local distance=(available.x-a.x)^2+(available.z-a.z)^2
   if available.carried>0 and distance<best then source,patch,best=candidate,available,distance end
  end
  if a.hp==0 then
   if a.carried>0 then local dropped=engine.spawn{x=a.x,y=a.y,z=a.z,kind=4,team=0,mode=3,hp=1000,max_hp=1000,carried=a.carried};if dropped~=0 then put(dropped,8,400+inv(h,7))end end
   engine.remove(h)
  elseif a.carried>0 and (a.carried>=8 or not patch or patch.carried==0 or inv(h,7)~=kind)then
   if near(a,home,3)then local count=a.carried;local identity=inv(h,7);if engine.deliver(h)then set(27+identity,get(27+identity)+count)end
   else engine.order(a.owner,h,1,home.x,home.y,home.z,0)end
  elseif patch and patch.carried>0 then
   if a.carried==0 then put(h,7,kind)end
   if near(a,patch,2)then engine.order(a.owner,h,4,patch.x,patch.y,patch.z,source)
   else engine.order(a.owner,h,1,patch.x,patch.y,patch.z,0)end
  end
 end
end

local function build(unit,price,second)
 if get(28)<price or get(29)<(second or 0) or #units(0,unit)>=4 then return false end
 local budget=engine.team(0)
 if budget.used_supply>=budget.supply or budget.credits-budget.reserved<price then return false end
 local prototype=spawn(unit==3 and 23 or unit==2 and 22 or 21,start_node(),0,90,unit)
 if prototype==0 then return false end
 local h=engine.construct(prototype,price,180,0,1);engine.remove(prototype)
 if h==0 then return false end
 engine.mode(h,0,7);put(h,8,unit);put(h,6,unit==3 and 6 or 5);put(h,7,1)
 set(28,get(28)-price);set(29,get(29)-(second or 0));return true
end

local function army(w)
 if w.tick%60~=0 then return end
 local leader
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 and body(i) and body(i).hp>0 then leader=body(i);break end end
 if not leader then return end
 for _,h in ipairs(units(0))do local a=actor(h);local role=inv(h,8)
  if role>=1 and role<=3 and a.hp==0 then engine.remove(h)
  elseif (role>=1 and role<=3 or role==12) and a.hp>0 and a.build_ticks==0 then
   local target,enemy=closest(w,a,1,22,inv(h,6))
   if enemy and inv(h,6)&inv(target,7)~=0 then
    engine.order(a.owner,h,0,a.x,a.y,a.z,0)
    if w.tick%180==(h%3)*60 then launch(h,target,role==2 and 24 or role==3 and 28 or 14,day==23 and role==2 and 5 or 0,0)end
   elseif role~=12 then engine.order(a.owner,h,1,leader.x,leader.y,leader.z,0)end
  end
 end
end

local function supplies(w,types,number)
 local found=base_resources()
 for kind=1,types do if not found[kind]then resource(kind,start_node()+kind)end end
 workers(number);harvest(w,types);army(w)
end

local function built(role)
 for _,h in ipairs(units(0,role))do if actor(h).hp>0 and actor(h).build_ticks==0 then return true end end
 return false
end

local function structure(role,price)
 if built(role)then return true end
 for _,h in ipairs(units(0,role))do if actor(h).hp>0 then return false end end
 if get(28)<price then return false end
 local prototype=spawn(role==10 and 26 or role==11 and 27 or 28,start_node(),0,180,role)
 if prototype==0 then return false end
 local h=engine.construct(prototype,price,180,0,0);engine.remove(prototype)
 if h==0 then return false end
 put(h,6,1);put(h,7,1);set(28,get(28)-price);return true
end


local mission={alt=true,weapons={{damage=18,cooldown=25,melee=true},{damage=17,cooldown=30,ammo=1},{damage=8,cooldown=30,melee=true}}}
function mission.init(w)set(6,0)end
function mission.boss_init(w)
 set(12,spawn(25,finish_node()-2,1,50,270));set(13,spawn(25,finish_node()-1,1,50,270))
end
function mission.prepare(w)supplies(w,3,6)end
function mission.player(w,p,i,pressed)
 if get(5)==0 and interact(p,i,start_node()+1,4)then set(5,1);set(10,12)end
 if interact(p,i,start_node(),4)then
  if inv(get(body_slot(i)),13)==2 and not built(12)then structure(12,6)
  elseif not built(10)then structure(10,4)
  elseif not built(11)then structure(11,4)
  elseif get(6)==0 and get(28)>=8 and get(29)>=8 and get(30)>=4 and get(10)>=8 and purchase(8)then set(28,get(28)-8);set(29,get(29)-8);set(30,get(30)-4);set(10,get(10)-8);set(6,1);engine.checkpoint(2101)
  elseif get(6)==1 then build(inv(get(body_slot(i)),13)==1 and 2 or 1,4,0)end
 end
 if interact(p,i,finish_node()) and get(6)==1 and built(1) and built(2)then flag(1)end
end
function mission.update(w)
 supplies(w,3,6)
 if get(5)==0 then goal(start_node()+1,2,3);return end
 if get(6)==0 or not built(10) or not built(11) or not built(1)then goal(start_node(),2,3,0,0)
 elseif not built(2)then goal(start_node(),2,3,0,1)end
end
function mission.ready(w)return flagged(1)end
function mission.boss(w)
 local h=get(1);local a=actor(h);shield(h,not flagged(1))
 if a and a.hp>=240 then for _,slot in ipairs({12,13})do local engineer=actor(get(slot))
  if engineer and engineer.hp>0 then
   if w.tick%60==0 then engine.heal(h,4,0)end
   goal(finish_node()-(slot==12 and 2 or 1),1,3,get(slot),1);return
  end
 end end
 if a and a.hp<240 and not flagged(2)then
  flag(2);engine.remove(h);set(1,spawn(2,finish_node(),1,150,200));shield(get(1),false)
 end
 goal(finish_node(),1,4,get(1),1)
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
