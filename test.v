import os
import json
import net.http
import lib.vargs
import term
import lib

struct Plug {
   version string
   author string
   lite_path string
   plugins string
}

fn main(){
mut args := vargs.new(os.args, 1)
args.parse()
file := os.read_file("conf2.json") or {println("error: \nfailed to read the file") return }
f:=json.decode(Plug,file)?
plugs :=f.plugins.split(",")

match args.command
{
"get"{   
   if args.options['p'] in plugs{
   r:=http.get("https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/"+args.options['p']+".lua") or {
      println(term.bold(term.red("error: \nfailed to connect to the enpoint, check that your connection is open")))
      return
   }
   mut fi:= os.create(f.lite_path+"data/plugins/"+args.options['p']+'.lua') or {
      println("failed to create "+f.lite_path+"data/plugins/"+args.options['p']+'.lua')
      return 
   }
   fi.write(r.text) 
   print(r.text)
   }else{
         lib.help()
   }
}
"list"{
   println(term.green("All plugins:"))
   println("")
   for el in plugs{
      println(term.cyan("- "+el))
   }
 }
"search"{
    lib.search(args.options['p'],plugs)
}
"lib.help"{
   lib.help()
}
else{
   print("Command not found")
}
}
}