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
f:=json.decode(Plug,file) or {
   println(term.red('error: \nfailed to open or parse the \' conf.json\' file'))
   return
}
plugs :=f.plugins.split(",")

match args.command
{
   //i encountered a little problem importing this from utils.v so, i decided to let it as it is.
"get"{   
   if args.options['p'] in plugs{
   req:=http.get("https://raw.githubusercontent.com/rxi/lite-plugins/master/plugins/"+args.options['p']+".lua") or {
      println(term.bold(term.red("error: \nfailed to connect to the enpoint, check that your connection is open")))
      return
   }
   mut fi:= os.create(f.lite_path+"data/plugins/"+args.options['p']+'.lua') or {
      println("failed to create "+f.lite_path+"data/plugins/"+args.options['p']+'.lua')
      return 
   }
   fi.write(req.text) 
   print(req.text)
   }else{
         lib.help()
   }
}
"list"{
   lib.list_plugins(plugs)
 }
"search"{
    lib.search(args.options['p'],plugs)
}
"help"{
   lib.help()
}
else{
   println(term.bold(term.red("error: \nCommand not found")))
   lib.help()
}
}
}