
# Signal Processing Project

**Authors**: Emilio Santana-Ferro, Rasheed Martin, Mram Shalabi

## Overview

This project focuses on generating, analyzing, and filtering sound signals in MATLAB. It features audio synthesis, noise filtering, and spectrogram analysis. Key tasks include creating the "Mary Had a Little Lamb" song signal, adding noise, and visualizing the signal in time and frequency domains.

### Project Goals
- Generate musical signals within human hearing range (300 Hz to 3 kHz).
- Plot time-domain and frequency-domain representations.
- Add white noise and restore signal quality using filters.
- Visualize cleaned signals and analyze spectral properties.

## Features

1. **Signal Generation**: Creates sine waves for musical notes.
2. **Audio File Operations**: Reads, writes, and saves audio files as `.wav`.
3. **Filtering**: Adds Gaussian noise and removes it using a bandpass filter.
4. **Visualization**: Provides time-domain, frequency-domain, and spectrogram visualizations.
5. **Spectrogram Analysis**: Examines frequency composition over time.

## Getting Started

### Prerequisites
- MATLAB with Signal and Communications Toolboxes.
- OS: Windows 10 or Mac OS El Capitan 10.11.06 or newer.

### Installation
1. Download and install MATLAB.
2. Install required toolboxes through MATLAB.

## Usage

### Core Functions
- **Signal Creation**: Generates sine waves for each note.
- **Noise Addition**: Adds Gaussian noise at a specified SNR.
- **Filtering**: Cleans the audio with bandpass filters.
- **Spectrogram Generation**: Displays the frequency spectrum over time.

### Running the Code
- Modify parameters in `TermProject.m` to adjust notes, frequency, or filtering.
- Run MATLAB scripts to generate, save, and plot `.wav` files, time-frequency plots, and spectrograms.

## Files and Directories

- **Audio Files** (`.wav`): Contains original, noisy, and filtered audio files.
- **Figures** (`.fig`): Stores time, frequency, and spectrogram visualizations.
- **MATLAB Scripts**: `TermProject.m` for signal creation and processing.

## License

This project is licensed under the MIT License.
