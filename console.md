══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════
The following StateError was thrown building TodoListView:
Bad state: GetIt: Object/factory with type Logger is not registered inside GetIt.
(Did you accidentally do GetIt sl=GetIt.instance(); instead of GetIt sl=GetIt.instance;
Did you forget to register it?)
The relevant error-causing widget was:
  TodoListView
  TodoListView:file:///E:/Common/Apps/todo_app/lib/src/features/presentation/my_todos/my_todo_screen.dart:13:19
When the exception was thrown, this was the stack:
#0      throwIfNot (package:get_it/get_it_impl.dart:14:19)
#1      _GetItImplementation._findRegistrationByNameAndType (package:get_it/get_it_impl.dart:583:5)
#2      _GetItImplementation._get (package:get_it/get_it_impl.dart:641:11)
#3      _GetItImplementation.get (package:get_it/get_it_impl.dart:608:12)
#4      _GetItImplementation.call (package:get_it/get_it_impl.dart:720:12)
#5      new TodoCubit (package:todo_app/src/features/presentation/cubits/todo_cubit.dart:10:40)
#6      AppInitializer._createAppWidget.<anonymous closure> (package:todo_app/src/app_initializer.dart:99:45)
#7      _CreateInheritedProviderState.value (package:provider/src/inherited_provider.dart:736:36)
#8      _InheritedProviderScopeElement.value (package:provider/src/inherited_provider.dart:590:33)
#9      Provider.of (package:provider/src/provider.dart:303:37)
#10     ReadContext.read (package:provider/src/provider.dart:649:21)
#11     _BlocBuilderBaseState.initState (package:flutter_bloc/src/bloc_builder.dart:152:36)
#12     StatefulElement._firstBuild (package:flutter/src/widgets/framework.dart:5852:55)
#13     ComponentElement.mount (package:flutter/src/widgets/framework.dart:5699:5)
...     Normal element mounting (31 frames)
#44     Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
#45     MultiChildRenderObjectElement.inflateWidget (package:flutter/src/widgets/framework.dart:7169:36)
#46     MultiChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:7185:32)
...     Normal element mounting (338 frames)
#384    Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
#385    MultiChildRenderObjectElement.inflateWidget (package:flutter/src/widgets/framework.dart:7169:36)
#386    MultiChildRenderObjectElement.mount (package:flutter/src/widgets/framework.dart:7185:32)
...     Normal element mounting (466 frames)
#852    _InheritedProviderScopeElement.mount (package:provider/src/inherited_provider.dart:411:11)
...     Normal element mounting (7 frames)
#859    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
...     Normal element mounting (7 frames)
#866    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
...     Normal element mounting (7 frames)
#873    _NestedHookElement.mount (package:nested/nested.dart:187:11)
...     Normal element mounting (7 frames)
#880    _InheritedProviderScopeElement.mount (package:provider/src/inherited_provider.dart:411:11)
...     Normal element mounting (7 frames)
#887    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
...     Normal element mounting (7 frames)
#894    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
...     Normal element mounting (7 frames)
#901    _NestedHookElement.mount (package:nested/nested.dart:187:11)
...     Normal element mounting (7 frames)
#908    SingleChildWidgetElementMixin.mount (package:nested/nested.dart:222:11)
#909    Element.inflateWidget (package:flutter/src/widgets/framework.dart:4548:16)
#910    Element.updateChild (package:flutter/src/widgets/framework.dart:3998:20)
#911    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#912    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#913    ProxyElement.update (package:flutter/src/widgets/framework.dart:6051:5)
#914    _InheritedNotifierElement.update (package:flutter/src/widgets/inherited_notifier.dart:108:11)
#915    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#916    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#917    StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5884:11)
#918    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#919    StatefulElement.update (package:flutter/src/widgets/framework.dart:5909:5)
#920    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#921    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#922    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#923    ProxyElement.update (package:flutter/src/widgets/framework.dart:6051:5)
#924    _InheritedNotifierElement.update (package:flutter/src/widgets/inherited_notifier.dart:108:11)
#925    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#926    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#927    StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5884:11)
#928    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#929    StatefulElement.update (package:flutter/src/widgets/framework.dart:5909:5)
#930    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#931    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#932    StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5884:11)
#933    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#934    StatefulElement.update (package:flutter/src/widgets/framework.dart:5909:5)
#935    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#936    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#937    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#938    ProxyElement.update (package:flutter/src/widgets/framework.dart:6051:5)
#939    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#940    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#941    StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5884:11)
#942    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#943    StatefulElement.update (package:flutter/src/widgets/framework.dart:5909:5)
#944    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#945    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#946    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#947    ProxyElement.update (package:flutter/src/widgets/framework.dart:6051:5)
#948    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#949    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#950    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#951    ProxyElement.update (package:flutter/src/widgets/framework.dart:6051:5)
#952    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#953    _RawViewElement._updateChild (package:flutter/src/widgets/view.dart:481:16)
#954    _RawViewElement.update (package:flutter/src/widgets/view.dart:568:5)
#955    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#956    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#957    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#958    StatelessElement.update (package:flutter/src/widgets/framework.dart:5797:5)
#959    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#960    ComponentElement.performRebuild (package:flutter/src/widgets/framework.dart:5747:16)
#961    StatefulElement.performRebuild (package:flutter/src/widgets/framework.dart:5884:11)
#962    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#963    StatefulElement.update (package:flutter/src/widgets/framework.dart:5909:5)
#964    Element.updateChild (package:flutter/src/widgets/framework.dart:3982:15)
#965    RootElement._rebuild (package:flutter/src/widgets/binding.dart:1716:16)
#966    RootElement.update (package:flutter/src/widgets/binding.dart:1694:5)
#967    RootElement.performRebuild (package:flutter/src/widgets/binding.dart:1708:7)
#968    Element.rebuild (package:flutter/src/widgets/framework.dart:5435:7)
#969    BuildScope._tryRebuild (package:flutter/src/widgets/framework.dart:2695:15)
#970    BuildScope._flushDirtyElements (package:flutter/src/widgets/framework.dart:2752:11)
#971    BuildOwner.buildScope (package:flutter/src/widgets/framework.dart:3056:18)
#972    WidgetsBinding.drawFrame (package:flutter/src/widgets/binding.dart:1259:21)
#973    RendererBinding._handlePersistentFrameCallback (package:flutter/src/rendering/binding.dart:495:5)
#974    SchedulerBinding._invokeFrameCallback (package:flutter/src/scheduler/binding.dart:1434:15)
#975    SchedulerBinding.handleDrawFrame (package:flutter/src/scheduler/binding.dart:1347:9)
#976    LiveTestWidgetsFlutterBinding.handleDrawFrame (package:flutter_test/src/binding.dart:1886:13)
#977    SchedulerBinding._handleDrawFrame (package:flutter/src/scheduler/binding.dart:1200:5)
#981    _invoke (dart:ui/hooks.dart:332:10)
#982    PlatformDispatcher._drawFrame (dart:ui/platform_dispatcher.dart:444:5)
#983    _drawFrame (dart:ui/hooks.dart:302:31)
(elided 3 frames from dart:async)
════════════════════════════════════════════════════════════════════════════════════════════════════
══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following TestFailure was thrown running a test:
Expected: exactly one matching candidate
  Actual: _TypeWidgetFinder:<Found 0 widgets with type "CenteredMessage": []>
   Which: means none were found but one was expected
When the exception was thrown, this was the stack:
#4      main.<anonymous closure>.<anonymous closure> (file:///E:/Common/Apps/todo_app/integration_test/app_test.dart:25:9)
<asynchronous suspension>
#5      testWidgets.<anonymous closure>.<anonymous closure> (package:flutter_test/src/widget_tester.dart:192:15)
<asynchronous suspension>
#6      TestWidgetsFlutterBinding._runTestBody (package:flutter_test/src/binding.dart:1059:5)
<asynchronous suspension>
<asynchronous suspension>
(elided one frame from package:stack_trace)
This was caught by the test expectation on the following line:
  file:///E:/Common/Apps/todo_app/integration_test/app_test.dart line 25
The test description was:
  tap on the floating action button, verify that a new task is created
════════════════════════════════════════════════════════════════════════════════════════════════════
══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following message was thrown:
Multiple exceptions (2) were detected during the running of the current test, and at least one was
unexpected.
════════════════════════════════════════════════════════════════════════════════════════════════════