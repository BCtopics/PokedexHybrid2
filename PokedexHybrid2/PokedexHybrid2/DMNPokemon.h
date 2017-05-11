//
//  DMNPokemon.h
//  PokedexHybrid2
//
//  Created by Bradley GIlmore on 5/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNPokemon : NSObject

- (instancetype)initWithName:(NSString *)name
                  identifier:(NSInteger)identifier
                   abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

@end
