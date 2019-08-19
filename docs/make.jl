push!(LOAD_PATH,"../src/")

using Documenter

using Genie, Genie.App, Genie.AppServer, Genie.Assets
using Genie.Cache, Genie.Commands, Genie.Configuration, Genie.Cookies
using Genie.Encryption, Genie.FileTemplates, Genie.Flax, Genie.Generator
using Genie.Helpers, Genie.Inflector, Genie.Input, Genie.Loggers, Genie.Plugins
using Genie.Renderer, Genie.REPL, Genie.Requests, Genie.Responses, Genie.Router
using Genie.Sessions, Genie.Tester, Genie.Toolbox, Genie.Util, Genie.WebChannels

push!(LOAD_PATH,  "../../src",
                  "../../src/cache_adapters",
                  "../../src/session_adapters")

makedocs(sitename = "Genie - The Highly Productive Julia Web Framework")