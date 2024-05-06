set_project("c-template")
set_version("0.1.0")
set_languages("c17")
set_toolchains("mingw")

add_rules("mode.debug", "mode.release")
add_includedirs("include", "include/utils")

task("run-main")
    on_run(function ()
        os.exec("xmake f -m debug")
        os.exec("xmake")
        os.exec("xmake run main")
    end)
    set_menu{
        usage = "xmake run-main",
        description = "Run main on debug mode"
    }
task_end()

task("run-test")
    on_run(function ()
        os.exec("xmake f -m debug")
        os.exec("xmake")
        os.exec("xmake run test")
    end)
    set_menu{
        usage = "xmake run-test",
        description = "Run test on debug mode"
    }
task_end()

target("add")
    set_kind("static")
    add_files("src/utils/add.c")

target("sub")
    set_kind("static")
    add_files("src/utils/sub.c")

target("hello")
    set_kind("static")
    add_files("src/hello.c")

target("main")
    set_kind("binary")
    add_files("src/main.c")
    add_deps("add", "sub", "hello")

target("test")
    set_kind("binary")
    add_files("src/test.c")
    add_deps("add", "sub", "hello")
