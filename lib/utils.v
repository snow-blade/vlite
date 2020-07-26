module lib
import term
import time

pub fn banner() string {
   return "
██╗   ██╗██╗     ██╗████████╗███████╗
██║   ██║██║     ██║╚══██╔══╝██╔════╝
██║   ██║██║     ██║   ██║   █████╗  
╚██╗ ██╔╝██║     ██║   ██║   ██╔══╝  
 ╚████╔╝ ███████╗██║   ██║   ███████╗
  ╚═══╝  ╚══════╝╚═╝   ╚═╝   ╚══════╝
             
   _  _   _  | 
a (_ (_) (_) | package manager for the lite text editor  \n                                "      
 
}


pub fn list_plugins(plugs []string) {
   println(term.green("All plugins:"))
   print("")
   for el in plugs{
      println(term.cyan("- "+el))
   }
}

pub fn search(pack string,packs []string){
     if pack in packs{
        print(term.bold(term.green("Package "+pack+" exists")))
     }
     else{
        println(term.bold(term.red("Package "+pack+" does not exist in remote repo")))
        for el in packs{
           if pack in el{
              println(term.yellow("Suggesting: "+el))
              time.sleep(1)
            }
           
        }
     }
}

pub fn help() {
   print(term.bold(term.green(banner())))
   println("")
   println(term.green("help :"))
   println("|")
   println(term.yellow("+----> Get a package:  ./vlite get -p <Name of the package> "))
   println("|                                                                   +")
   println(term.yellow("+----> List packages: ./vlite list"))
   println("|                                                                   +")
   println(term.yellow("+----> Get help: ./vlite help"))
   println("|                                                                   +")
   println(term.yellow("+----> Search for a package: ./vlite search -p <Name of the package>"))
   println("|                                                                   +")
   println(term.yellow("+-------------------------------------------------------------------+"))  
}