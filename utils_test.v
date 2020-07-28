
import lib.vargs
import json
import lib
import os
import term

struct Plug {
   version string
   author string
   lite_path string
   plugins string
}

const (
    test_arr = ['hello', '-f', 'bar', '--foo', 'baz', '--lol=yey', '-t=test', '123', '-n', '--foo', 'bal']
)

fn test_parse() {
    mut a := vargs.new(test_arr, 0)
    a.parse()

    assert a.command == 'hello'
    assert a.options['f'] == 'bar'
    assert a.options['foo'] == 'baz,bal'
    assert a.options['lol'] == 'yey'
    assert a.options['t'] == 'test'
    assert a.options['n'] == ''
    assert a.unknown[0] == '123'
}

fn test_array_option() {
    mut a := vargs.new(test_arr, 0)
    a.parse()
    option_arr := a.array_option('foo')

    assert option_arr.len == 2
    assert option_arr[0] == 'baz'
    assert option_arr[1] == 'bal'
}

fn test_alias() {
    mut a := vargs.new(test_arr, 0)
    a.alias('f', 'foo')
    a.parse()

    assert a.options['foo'] == 'bar,baz,bal'
}
fn test_json(){
	json_file := os.read_file("conf.json") or {println("error: \nfailed to read the file") return }
    decoded:=json.decode(Plug,json_file) or {
      println(term.red('error: \nfailed to open or parse the \' conf.json\' file'))
      return
   }
   assert os.exists(decoded.lite_path)==true

}

fn test_banner() {
	mut r:="
██╗   ██╗██╗     ██╗████████╗███████╗
██║   ██║██║     ██║╚══██╔══╝██╔════╝
██║   ██║██║     ██║   ██║   █████╗  
╚██╗ ██╔╝██║     ██║   ██║   ██╔══╝  
 ╚████╔╝ ███████╗██║   ██║   ███████╗
  ╚═══╝  ╚══════╝╚═╝   ╚═╝   ╚══════╝
             
   _  _   _  | 
a (_ (_) (_) | package manager for the lite text editor  \n                                "      
assert lib.banner()==r
}