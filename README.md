<div align="center">

# 🌍 Wejha · وجهة

**A guide to five Saudi cities, built in Flutter.** 📱

*Wejha* means *destination* in Arabic. Pick a city, see what's worth your time there. ✨

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20Web-lightgrey)]()
[![License](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

## 💡 What it is

Most travel apps drown you in listings. Wejha does the opposite: five cities, five things to do in each, written the way a friend who lives there would tell you. No ratings, no sponsored pins, no infinite scroll.

🏙️ Riyadh · 🏜️ AlUla · 🌊 Jeddah · ⛰️ Abha · 🏖️ Dammam

---

## 📸 Screens

<div align="center">

| 🧭 Explore | 🔍 Live search |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/098160a8-842b-45d5-8b71-9982d5ab1d8d" width="260"/> | <img src="https://github.com/user-attachments/assets/b6384f1b-fd5c-41e5-8cbb-39551459b44d" width="260"/> |
| Photographic header with the trip counter, then the city cards. | Filters as you type — one `onChanged` rebuilding the list. |

| 🏙️ City detail | 📍 Things to do |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/bb1ef6ee-e68b-4382-85b8-d826a33a3ec2" width="260"/> | <img src="https://github.com/user-attachments/assets/7122004d-7a86-4438-b768-7215d1b398ae" width="260"/> |
| Full-bleed hero, a gradient scrim, Playfair Display over the photo. | Five numbered picks with a one-line note on each. |

</div>

---

## ⚡ Features

- 🔍 **Live search** — case-insensitive filtering on every keystroke, with a proper empty state instead of a blank screen.
- 🧭 **Two-screen navigation** — `Navigator.push` into a detail view built from the tapped city, and a styled return path.
- ✍️ **Editorial typography** — Playfair Display via `google_fonts` for city names, system sans for body copy. The contrast is the whole visual identity.
- 🎨 **Layered headers** — `Stack` + `Positioned` puts the search bar on top of the hero photo; a four-stop `LinearGradient` melts the image into the page background so there's no hard seam.
- 📐 **Responsive by fraction, not by pixel** — every dimension is derived from `MediaQuery.sizeOf(context)`, so the layout holds from a small phone to a browser window.
- 🛟 **Graceful image failure** — `errorBuilder` on every `Image.asset` swaps in a placeholder tile rather than throwing a red box.

---

## 🎯 Design notes

| Decision | Why |
|---|---|
| 🌫️ Gradient fading to `#F4F4F4` at the bottom of the hero | The photo ends *into* the page instead of stopping at an edge — the header and the list read as one surface. |
| 🔵 Numbers in a circle, not bullet icons | Keeps "top things to do" feeling ranked and finite. Five is the point. |
| 💙 One accent colour (`#1C4C7C`) | Deep blue on white. Everything else is greyscale, so the accent always means "this is interactive". |
| ✂️ Notes capped at one line | A recommendation you can read at a glance beats a paragraph you skip. |

**🎨 Palette**

`#1C4C7C` primary · `#E3EDF6` accent fill · `#F4F4F4` background · `#FFFFFF` cards · `#E7EAEF` borders · `#1D1B19` headings · `#77808A` body · `#9AA1A9` muted

---

## 🏗️ Architecture

```
lib/
├── main.dart                    # MaterialApp entry point
├── data/
│   └── data.dart                # cities, each with its own things-to-do list
├── model/
│   ├── city_model.dart          # CityModel + fromJson
│   └── activity_model.dart      # ActivityModel + fromJson
└── screen/
    ├── home_screen.dart         # stateful: search query, tab index, city list
    └── detail_screen.dart       # stateless: renders whatever city it's handed

assets/
└── photos/
    ├── gradient.jpg             # home screen hero
    └── cities/                  # one photo per city, named to match data.dart
        ├── riyadh.jpg
        ├── alula.jpg
        ├── jeddah.jpg
        ├── abha.jpg
        └── dammam.jpg
```

Deliberately flat. `HomeScreen` is the only stateful widget in the app — it owns the search query and the selected tab, and nothing else needs to. `DetailScreen` is pure: give it a city map, it renders. No state management package, no dependency injection, no ceremony for a four-file app.

Data lives in `lib/data.dart` as two structures — a `List` of cities and a `Map<String, List<Map>>` of activities keyed by city name. Adding a sixth city is a matter of appending one entry to each and dropping a JPG in `assets/photos/cities/`. Nothing in the UI is hardcoded to a specific city.

**🧰 Stack:** Flutter · Dart 3.13+ · `google_fonts` · `flutter_lints`

---

## 🚀 Run it

```bash
git clone https://github.com/AbdullahWM/Flutter_Project_One.git
cd Flutter_Project_One
flutter pub get
flutter run
```

Requires Flutter 3.x with Dart SDK 3.13.1 or newer. Configured for **Android** 🤖 and **Web** 🌐 — `flutter run -d chrome` for the browser.

---

## 🗺️ Roadmap

- [ ] 🔖 Persist saved cities so the **Saved** tab has something to hold
- [ ] 🔢 Wire the visited/to-go counter to real state instead of the current static values
- [ ] 📍 Map view per city, pinning the five recommendations
- [ ] 🇸🇦 Arabic localisation with full RTL support
- [ ] 🔌 Move `data.dart` behind a repository interface so it can be swapped for a remote source

---

## 🙏 Credits

Built by [**Abdullah AlManeea**](https://github.com/AbdullahWM). 📷 Photography of Riyadh, AlUla, Jeddah, Abha and Dammam bundled under `assets/photos/`.

<div align="center">

*Five cities. Twenty-five reasons to go.* ✈️

</div>
