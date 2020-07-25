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
     }else{
        print(term.bold(term.red("Package "+pack+" does not exist")))
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
   println(term.yellow("+----> Get lib.help: ./vlite lib.help"))
   println("|                                                                   +")
   println(term.yellow("+----> Search for a package: ./vlite search -p <Name of the package>"))
   println("|                                                                   +")
   println(term.yellow("+-------------------------------------------------------------------+"))
}