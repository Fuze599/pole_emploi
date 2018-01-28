/*
          Addon created by Fuze
*/





---> Languages (French or English) <---

local Language = "French"

---> Create button <---

ALLJOB = {}

ALLJOB[1] = {
	JOBNAME = "Citizen", ---> Write the job's name
	MODEL = "models/Humans/Group01/Female_01.mdl", ---> Change the model
	DESCRIPTION = "You're a citizen and you're handsome !\nDo good actions !", ---> Write the description here and put \n for change line
	COMMAND = "/citizen", ---> Change the command 
	VOTING = false,
}
ALLJOB[2] = {
	JOBNAME = "Medic",
	MODEL = "models/Kleiner.mdl",
	DESCRIPTION = "You're a medic.",
	COMMAND = "/medic",
	VOTING = true,
}
ALLJOB[3] = {
	JOBNAME = "CP",
	MODEL = "models/Police.mdl",
	DESCRIPTION = "You're a cp. ",
	COMMAND = "/cp",
	VOTING = true,
}
ALLJOB[4] = {
	JOBNAME = "Gun Dealer",
	MODEL = "models/monk.mdl",
	DESCRIPTION = "You're a gun dealer.",
	COMMAND = "/gun",
	VOTING = true,
}



if Language == "English" then
mynameis = "Hi, my name is\n"
looking4job = "\nI'm looking 4 a Job !"
welcome = "Welcome :       "
looking4headtext = "You are looking 4 a job ! I can help you !"  
choice = "Choose"
else
mynameis = "Salut, mon nom est\n"
looking4job = "\nJe recherche un job !"
welcome = "Bienvenue :       "
looking4headtext = "Tu recherche un job ? Je peux t'aider !"  
choice = "Choisir"
end