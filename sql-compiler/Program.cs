using System;
using System.IO;
using System.Collections.Generic;
using GlobExpressions;

class Program {
	static void Main(string[] args) {
		Directory.SetCurrentDirectory("../");

		string output = "couriers.sql";
		string exampleOutput = "examples.sql";
		string patternListSource = "compile.bat";
		string patternListSet = "AllFiles";

		if(args.Length > 0)
			output = args[0];
		if(args.Length > 1)
			exampleOutput = args[1];
		if(args.Length > 2)
			patternListSource = args[2];
		if(args.Length > 3)
			patternListSet = args[3];

		string patternsSourceText = File.ReadAllText(patternListSource);
		int from = patternsSourceText.IndexOf("goto " + patternListSet);
		int to = patternsSourceText.IndexOf(":" + patternListSet);
		if(from == -1 || to == -1 || from > to) {
			Console.WriteLine("Error: Patterns Set doesn't exist!");
			return;
		}

		Queue<string> patterns = new Queue<string>(
			patternsSourceText[from..to]
			.Split(
				new string[] { "\r\n", "\r", "\n" },
				StringSplitOptions.None
			)
		);
		patterns.Dequeue(); // Otherwise "goto patternListSet" is included in patterns

		List<string> includedFiles = new List<string>();

		string outputText = "";
		string exampleText = "";

		foreach(string pattern in patterns) {
			foreach(string file in
				Directory.GetFiles(Directory.GetCurrentDirectory(), "*", SearchOption.AllDirectories)
			) {
				if((!includedFiles.Contains(file)) && Glob.IsMatch(file, pattern)) {
					includedFiles.Add(file);
					outputText += File.ReadAllText(file) + Environment.NewLine;
					if(getTextBetweenStrings(File.ReadAllText(file), "/* Example", "*/") != "")
					exampleText += 
					"-- " + Path.GetRelativePath(Directory.GetCurrentDirectory(), file)
					+ Environment.NewLine +
					getTextBetweenStrings(File.ReadAllText(file), "/* Example", "*/")
					.TrimStart(Environment.NewLine.ToCharArray()) + Environment.NewLine;
					//Console.WriteLine(file);
				}	
			}
		}

		File.WriteAllText(output, outputText);
		if(exampleOutput != "")
			File.WriteAllText(exampleOutput, exampleText);

	}

	static string getTextBetweenStrings(string text, string from, string to) {
		int fromIndex = text.IndexOf(from);
		int toIndex = text.IndexOf(to);
		if(fromIndex == -1 || toIndex == -1)
			return "";
		if(fromIndex > toIndex) {
			int temp = fromIndex;
			fromIndex = toIndex;
			toIndex = temp;
		}

		return (text[fromIndex..toIndex]).Substring(from.Length);
	}
}
