-module(jelu_plugin_test_auth).

-export([ init/1
        , check/2
        , description/0
        ]).

init(Opts) -> {ok, Opts}.

check(_Credentials = #{client_id := ClientId, username := Username, password := Password}, _State) ->
    io:format("Auth Demo: clientId=~p, username=~p, password=~p~n", [ClientId, Username, Password]),
    ok.

description() -> "Auth Demo Module".
