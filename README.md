# myCompiler

최초 커밋: 2024/5/29   최근 커밋: 2024/12/26

---

# 1. 프로젝트 개요

## 1. 프로젝트 정의

myCompiler는 영어 문장의 형태로 만들어져 직관적으로 이해할 수 있는 프로그래밍 언어, cbnu의 컴파일러이다.

## 2. 프로젝트 배경

이 프로젝트는 **충북대학교 2024년도 1학기 컴파일러** 과목의 개인 과제이다.

cbu라는 이름의 프로그래밍 언어를 스스로 창작하고 이를 컴파일 하는 컴파일러를 만들어 보는 과제이다.

대부분의 프로그래밍 언어의 문법은 문장이나 단어 보다는 기호를 주로 사용하는데, 이보다는 영어 문장의 형태로 작성하여 보다 쉽게 소스코드를 이해할 수 있는 언어를 만들어 보고자 하였다. 

## 3. 프로젝트 주요 기능

### 1. 사칙연산 문법

- **더하기**: plus
- **빼기**: minus
- **곱하기**: times
- **나누기**: divided by

### 2. 다른 문법 기호

- **대입 연산자**: is
- **문장 종결 기호(C언어에서 세미콜론)**: .

### 3. 기타 문법

- 소스코드는 항상 begin으로 시작하여 finish로 끝나야 한다.

# 2. 사용법

## 1. cbu언어 컴파일러, myCompiler 만들기

- lex 및 yacc 언어 컴파일러 설치

[Win flex-bison](https://sourceforge.net/projects/winflexbison/)

- 배치 파일을 활용하여 명령어 실행

프로젝트 디렉토리의 flex.bat과 bison.bat 배치 파일에는 myCompiler.l과 myCompiler.y파일을 컴파일 하는 명령어가 정의되어 있다.

터미널에 아래 명령어를 입력하여 각각 lex와 yacc파일을 컴파일하면 myCompiler를 만드는데 필요한 두 C 파일, myCompiler.c와 myCompilerlex.c가 만들어 진다.

```powershell
./flex myCompiler
./bison myCompiler
```

- 생성된 C 파일 컴파일(경고가 발생하지만 무시)

```powershell
gcc -o myCompiler.exe myCompiler.c myCompilerlex.c
```

이후 생성되는 myCompiler.exe가 바로 컴파일러가 된다.

## 2. cbu파일을 만들고 컴파일 하기

위에서 설명한 문법에 따라 스스로 cbu 소스파일을 만들어 본다. mySample.cbu 파일을 참고해도 좋다.

cbu 파일을 만들었다면 아래 명령어를 통해 컴파일한다.

```powershell
./myCompiler.exe [파일이름].cbu
```

명령을 실행하면 myAssembly.asm 어셈블리코드 파일이 만들어 진다.

## 3. 어셈블리어 해석 프로그램 StackSim으로 실행결과 확인하기

myAssembly.asm 파일에는 cbu의 소스코드를 해석한 가상의 스택 기계 코드가 쓰여져 있다. 이를 실행 시켜주는 프로그램이 StackSim.exe이다.

myAssembly.asm의 가상 스택 기계 코드는 교수님께서 만든 별도의 규칙이다. 또한 StackSim.exe 프로그램도 교수님께서 만드신 프로그램으로 이 두 창작물의 저작권은 교수님에게 있다.

**`StackSim (C) Copyright by Jae Sung Lee (jasonlee@cbnu.ac.kr), 2022.`**

아래 명령어를 입력하여 스스로 만든 cbu 파일의 실행 결과를 확인한다.

```powershell
./StackSim.exe myAssembly.asm
```