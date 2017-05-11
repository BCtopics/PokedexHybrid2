//
//  DMNPokemonController.h
//  PokedexHybrid2
//
//  Created by Bradley GIlmore on 5/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNPokemon;

NS_ASSUME_NONNULL_BEGIN

@interface DMNPokemonController : NSObject

+ (void)fetchPokmeonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
