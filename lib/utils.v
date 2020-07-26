module lib
import term

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
              println(term.yellow("Maybe you meant: "+el))
           }
           
        }
     }
}

pub fn help() {
   println("")
   println(term.green("help :"))
   println(term.yellow("|-------------------------------------------------------------------+"))
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