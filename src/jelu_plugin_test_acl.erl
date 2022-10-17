-module(jelu_plugin_test_acl).

-include_lib("include/emqx.hrl").

%% ACL callbacks
-export([ init/1
        , check_acl/2
        , reload_acl/1
        , description/0
        ]).

init(Opts) ->
    {ok, Opts}.

check_acl({Credentials, PubSub, _NoMatchAction, Topic}, _State) ->
    io:format("ACL Demo: ~p ~p ~p~n", [Credentials, PubSub, Topic]),
    allow.

reload_acl(_State) ->
    ok.

description() -> "ACL Demo Module".
