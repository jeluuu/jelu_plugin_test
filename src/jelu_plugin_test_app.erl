%%--------------------------------------------------------------------
%% Copyright (c) 2020 EMQ Technologies Co., Ltd. All Rights Reserved.
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(jelu_plugin_test_app).

-behaviour(application).

-emqx_plugin(?MODULE).

-export([ start/2
        , stop/1
        ]).

start(_StartType, _StartArgs) ->
    {ok, Sup} = jelu_plugin_test_sup:start_link(),
    jelu_plugin_test:load(application:get_all_env()),
    % ok = emqx:hook('client.authenticate', fun jelu_plugin_auth:check/2, []),
    % ok = emqx:hook('client.check_acl', fun jelu_plugin_test_acl:check_acl/2, []),

    ok = emqx_ctl:register_command(jelu_plugin_test, {jelu_plugin_test_cli, cli}, []),

    {ok, Sup}.

stop(_State) ->
    jelu_plugin_test:unload().

