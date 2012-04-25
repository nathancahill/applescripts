#import <mach-o/dyld.h>

extern int NSApplicationMain(int argc, const char *argv[]);

int main(int argc, const char *argv[])
{
	if (NSIsSymbolNameDefined("_ASKInitialize"))
	{
		NSSymbol *symbol = NSLookupAndBindSymbol("_ASKInitialize");
		if (symbol)
		{
			void (*initializeASKFunc)(void) = NSAddressOfSymbol(symbol);
			if (initializeASKFunc)
			{
				initializeASKFunc();
			}
		}
	}
	
    return NSApplicationMain(argc, argv);
}
