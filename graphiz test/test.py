import graphviz as gz

dot = gz.Digraph()
dot.node('1', 'Test1')
dot.node('2', 'Test2')
dot.node('3', 'Test3')
dot.node('4', 'Test4')

dot.edges(['12', '23', '34', '24'])
dot.format = 'svg'
dot.render('test.gv')

dot.format = 'png'
dot.render('test.gv')


