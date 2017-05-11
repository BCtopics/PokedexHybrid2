//
//  DMNPokemonController.m
//  PokedexHybrid2
//
//  Created by Bradley GIlmore on 5/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "DMNPokemonController.h"
#import "DMNPokemon.h"
#import "PokedexHybrid2-Swift.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation DMNPokemonController

+ (void)fetchPokmeonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion
{

    if (!completion){ completion = ^(DMNPokemon *p) {}; }
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [NetworkController performRequestFor:searchURL httpMethodString:@"GET" urlParameters:nil body:nil completion:^(NSData * data, NSError * error) {
       
        if (error) {
            NSLog(@"Error getting pokemon for %@: %@", searchTerm, error);
            completion(nil);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error parsing JSON: %@", error);
            completion(nil);
            return;
        }
        
        DMNPokemon *pokemon = [[DMNPokemon alloc] initWithDictionary:dictionary];
        completion(pokemon);
    }];
    
}


@end
