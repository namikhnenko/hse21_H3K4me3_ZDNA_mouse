# hse21_H3K4me3_ZDNA_mouse
Bioinformatics project (ZDNA + ES-E14)

Genome version: mm10

# Результаты

## Анализ пиков гистоновой метки

### Распределение длин участков

#### ENCFF993IIG

Перед фильтрацией

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/len_hist.H3K4me3_ES_E14.ENCFF993IIG.mm10.pdf.png-1.png)

Выбранный порог длины: 5000

После фильтрации 


![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/filter_peaks.H3K4me3_ES_E14.ENCFF993IIG.mm10.filtered.hist.pdf.png-1.png)

#### ENCFF899LDH

Перед фильтрацией

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/len_hist.H3K4me3_ES_E14.ENCFF899LDH.mm10.pdf.png-1.png)

Выбранный порог длины: 5000

После фильтрации


![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/filter_peaks.H3K4me3_ES_E14.ENCFF899LDH.mm10.filtered.hist.pdf.png-1.png)

### Расположение пиков относительно аннотированных генов

#### ENCFF993IIG

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/chip_seeker.H3K4me3_ES_E14.ENCFF993IIG.mm10.filtered.annopie.pdf.png-1.png)

#### ENCFF899LDH

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/chip_seeker.H3K4me3_ES_E14.ENCFF899LDH.mm10.filtered.annopie.pdf.png-1.png)

### Визуализация пиков и их объединения

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/source_merge.png)

## Анализ вторичной структуры ДНК 

Структура - ZDNA_mouse_1

### Распределение длин участков

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/len_hist.mouseZ-DNA1.pdf.png-1.png)

### Расположение пиков относительно аннотированных генов

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/chip_seeker.mouseZ-DNA1.annopie.pdf.png-1.png)

## Анализ пересечения гистоновой метки и структуры ДНК

### Распределение длин участков

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/len_hist.H3K4me3_ES_E14.intersect_with_ZDNA.pdf.png-1.png)

### Расположение пиков относительно аннотированных генов

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/chip_seeker.H3K4me3_ES_E14.intersect_with_ZDNA.annopie.pdf.png-1.png)

### Визуализация исходных участков ДНК и пересечения с гистоновой меткой

Ссылка на сохраненную сессию: http://genome.ucsc.edu/s/namikhnenko/H3K4me3_ZDNA_ES_E14

chr1:3,670,546-3,671,504

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/inter3.png)

chr1:4,491,779-4,493,869

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/inter4.png)

### Ассоциация пересечений с генами

Количество пиков, которые удалось проассоциировать: 1125

Количество уникальных генов: 1088

### GO анализ

Общая информация

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/go_summary.jpg)

Наиболее важные категории

![alt text](https://github.com/namikhnenko/hse21_H3K4me3_ZDNA_mouse/blob/main/images/go_analiysis.png)

# Команды

Получение данных:

wget https://www.encodeproject.org/files/ENCFF993IIG/@@download/ENCFF993IIG.bed.gz
    
wget https://www.encodeproject.org/files/ENCFF899LDH/@@download/ENCFF899LDH.bed.gz

Разархивация:
    
gzip -d ENCFF899LDH.bed.gz 

gzip -d ENCFF993IIG.bed.gz 

Нужные колонки:

cat ENCFF899LDH.bed | cut -f1-5 > H3K4me3_ES_E14.ENCFF899LDH.mm10.bed

cat ENCFF993IIG.bed | cut -f1-5 > H3K4me3_ES_E14.ENCFF993IIG.mm10.bed

Приведение к версии mm9 (для тренировки)
    
wget https://hgdownload.cse.ucsc.edu/goldenpath/mm10/liftOver/mm10ToMm9.over.chain.gz
    
liftOver H3K4me3_ES_E14.ENCFF899LDH.mm10.bed mm10ToMm9.over.chain.gz H3K4me3_ES_E14.ENCFF899LDH.mm9.bed H3K4me3_ES_E14.ENCFF899LDH.unmapped.bed
    
liftOver H3K4me3_ES_E14.ENCFF993IIG.mm10.bed mm10ToMm9.over.chain.gz H3K4me3_ES_E14.ENCFF993IIG.mm9.bed H3K4me3_ES_E14.ENCFF993IIG.unmapped.bed
