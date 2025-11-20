//
//  CardContentFactory.swift
//  EmojiHubUI
//
//  Created by Ayush Kumar Singh on 11/13/24.
//
//
import Foundation

// MARK: - Content Sources

/// A set of autumn-themed emojis.
let fallVibes = [
    "🍁", "🥮", "🍂", "🎃", "🌰", "🍎", "🧣", "🧡",
    "🍠", "🍄", "🦊", "🌻", "🍃", "🍇", "🥧", "🍯",
    "🍞", "🌾", "🚜", "🪵", "🧤", "☕️", "🧦", "🥕",
    "🥨", "🧺", "🫘", "🌙", "🐿️", "🦉", "🔥", "🥣"
]

/// A set of cozy, winter holiday emojis.
let cozyChristmas = [
    "🎅🏻", "☃️", "☕️", "🧣", "🧦", "🎄", "❄️", "🕯️",
    "🍪", "🌟", "🎁", "🧤", "🤶🏻", "🛷", "🌨️", "⛸️",
    "🧊", "🥮", "🍫", "🍷", "🥛", "🍰", "🥧", "🧁",
    "🎉", "🔔", "🧝🏻‍♂️", "📯", "🧑🏻‍🎄", "🍬", "🥂", "🎆"
]

/// A set of movie night emojis.
let movie = [
    "🎬", "🎞️", "🍿", "🎧", "🎟️", "🥤", "📽️", "🛋️",
    "🍫", "📺", "🎥", "🎚️", "🎛️", "🕹️", "💡", "🎙️",
    "📀", "💺", "📝", "🎭", "🎮", "🍕", "🌭", "🍦",
    "🍪", "🍒", "🧃", "📡", "🎦", "🍔", "🍟", "🧋"
]

// MARK: - Factory

// Grab a random emoji set from our presets.
func generateRandomContent() -> [String] {
    let options = [fallVibes, cozyChristmas, movie]
    return options.randomElement() ?? []
}

