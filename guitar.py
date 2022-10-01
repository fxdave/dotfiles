from dataclasses import dataclass
from typing import List


@dataclass
class Chord:
    notes: List[str]
    sus: int
    scale: str
    seven: bool

    def __str__(self):
        return "{first_note}{scale}\u001b[34m{sus}\u001b[31m{seven}\u001b[0m".format(
            first_note=self.notes[0],
            scale=self.scale,
            sus="sus" + str(self.sus) if self.sus != 3 else "",
            seven=self.scale + "7" if self.seven else "",
        )


notes = ["E", "F", "F#", "G", "G#", "A", "A#", "B", "C", "C#", "D", "D#"]

# The distances between the notes
scales = {
    "major": [2, 2, 1, 2, 2, 2, 1],
    "natuaral_minor": [2, 1, 2, 2, 1, 2, 2],
    "harmonic_minor": [2, 1, 2, 2, 1, 3, 2],
    "melodic_minor": [2, 1, 2, 2, 2, 2, 1],
    # exotics:
    "minor_pentatonic": [3, 2, 2, 3, 2],
    "blues": [3, 2, 1, 1, 3, 2],
    "major_pentatonic": [2, 2, 3, 2, 3],
    "ionian": [2, 2, 1, 2, 2, 2, 1],
    "dorian": [2, 1, 2, 2, 2, 1, 2],
    "phrygian": [1, 2, 2, 2, 1, 2, 2],
    "lydian": [2, 2, 2, 1, 2, 2, 1],
    "mixolydian": [2, 2, 1, 2, 2, 1, 2],
    "aeolian": [2, 1, 2, 2, 1, 2, 2],
    "locrian": [1, 2, 2, 1, 2, 2, 2],
    "whole_tone": [2, 2, 2, 2, 2, 2],
    "whole_half_diminished": [2, 1, 2, 1, 2, 1, 2, 1],
    "half_whole_diminished": [1, 2, 1, 2, 1, 2, 1, 2],
}


def get_scale(from_note, scale):
    # Find note
    current_distance = notes.index(from_note)
    # Collect scale notes
    note_ids = [current_distance]
    for distance in scale:
        current_distance += distance
        note_ids.append(current_distance)
    return [notes[i % len(notes)] for i in note_ids]


def get_chord(from_note, scale_name, sus=3, seven=False) -> Chord:
    scale = get_scale(from_note, scales[scale_name])
    # typical chord is the [1th, 3th, 5th] notes from the scale
    notes = [scale[0], scale[sus - 1], scale[4]]
    if seven:
        notes.append(scale[6])
    return Chord(notes, sus, scale_name, seven)


def get_all_chords(note):
    {
        "maj": get_chord(get_scale(note, scales["major"])),
        "majmaj7": get_chord(get_scale(note, scales["major"]), seven=True),
        "majsus2": get_chord(get_scale(note, scales["major"]), sus=2),
        "majsus4": get_chord(get_scale(note, scales["major"]), sus=4),
        "majsus2maj7": get_chord(get_scale(note, scales["major"]), seven=True, sus=2),
        "majsus4maj7": get_chord(get_scale(note, scales["major"]), seven=True, sus=4),
        "minor": get_chord(get_scale(note, scales["natuaral_minor"])),
        "minorminor7": get_chord(get_scale(note, scales["natuaral_minor"]), seven=True),
        "minorsus2": get_chord(get_scale(note, scales["natuaral_minor"]), sus=2),
        "minorsus4": get_chord(get_scale(note, scales["natuaral_minor"]), sus=4),
        "minorsus2minor7": get_chord(
            get_scale(note, scales["natuaral_minor"]), seven=True, sus=2
        ),
        "minorsus4minor7": get_chord(
            get_scale(note, scales["natuaral_minor"]), seven=True, sus=4
        ),
    }


def print_chord(chord_name, chord):
    print("{}\u001b[31mmaj7\u001b[0m: {}", chord_name, chord)


def draw_neck(notes_to_show):
    tab_length = 22

    def draw_string(string, notes_to_show):
        first_note_id = notes.index(string)
        get_symbol = lambda n: " " if n == 0 else "-"
        get_char = (
            lambda n, idx: (
                get_symbol(n)
                + notes[idx % len(notes)]
                + get_symbol(n) * (3 - len(notes[idx % len(notes)]))
            )
            if notes[idx % len(notes)] in notes_to_show
            else get_symbol(n) * 4
        )
        symbols = [get_char(n, first_note_id + n) for n in range(tab_length)]
        if string in notes_to_show:
            print("\u001b[33m" + "|".join(symbols) + "\u001b[0m")
        else:
            print("|".join(symbols))

    draw_string("E", notes_to_show)
    draw_string("A", notes_to_show)
    draw_string("D", notes_to_show)
    draw_string("G", notes_to_show)
    draw_string("B", notes_to_show)
    draw_string("E", notes_to_show)


def show_scales():
    for idx, (key, val) in enumerate(scales.items()):
        print("{}. {}: {}".format(idx, key, val))
    scale_id = int(input("Select scale [number]: ").strip())
    scale_name = list(scales.keys())[scale_id]

    action = input("Action [C=chords, N=show on neck]").strip().upper()
    if action == "C":
        note = input("Give me a note (e.g.: F#): ").strip().upper()
        sus = int(input("Sus [2,3,4]?: ").strip())
        seven = input("Seven [y,n]?: ").strip().upper() == "Y"
        chord = get_chord(note, scale_name, sus, seven)
        print("\n", str(chord), "\n")
        draw_neck(chord.notes)
    elif action == "N":
        note = input("Give me a note (e.g.: F#): ").strip().upper()
        draw_neck(get_scale(note, scales[scale_name]))


def show_neck():
    notes = input("list notes to show e.g: A,A#,F: ").strip().upper().split(",")
    draw_neck(notes)


while True:
    action = (
        input(
            """What do you want?
S: Scales (to build chords)
N: Show notes on neck
Q: Quit
"""
        )
        .strip()
        .upper()
    )
    if action == "S":
        show_scales()
    elif action == "N":
        show_neck()
    else:
        quit()
