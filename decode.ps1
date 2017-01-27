$array64 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/+="
$cipher = "honey","jelly","lollipop","spumoni","milkshake","shortcake","souffle","flower","fondant","crunch","pineapple","marionberry","lime","pudding","sugar","caramel","granita","zest","brittle","liquer","bun","toffee","ginger","custard","cookie","sucker","pistachio","meringue","eggs","peach","buttermilk","turnover","biscuits","turtle","puffs","doughnut","apricot","nutmeg","gingerbread","cherry","truffle","turnovers","licorice","mousse","muffins","raspberry","sorbet","streusel","candy","torte","syrup","terrine","curd","hazelnut","brownie","strawberries","blueberry","coconut","butterscotch","cookies","huckleberry","icing","walnut","pie","snickerdoodles","cannoli","marzipan","cake","compote","bonbon","glaze","flan","cane","foster","sherbet","ganache","cream","buttercream","jam","cobbler","tirimisu","creme","cupcake","cinnamon","mint","vanilla","éclair","taffy","orange","almond","rhubarb","pastry","brulee","lemon","cheesecake","chocolate","donut","sundae","peach pie","shortbread","frosting","parfaits","blackberry","popsicle","confection","crepe","macaroon"
$clear64 = ""

$exfiltrated = [system.io.File]::ReadAllText($args[0]).Trim().Split(" ")

foreach ($word in $exfiltrated)
{
    $clear64 = $clear64 + $array64[$cipher.IndexOf($word)]
}
[io.file]::WriteAllBytes($args[1],[Convert]::FromBase64String($clear64))