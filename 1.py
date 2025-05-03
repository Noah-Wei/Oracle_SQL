import random

def guess_the_number():
    # 生成一个1到100之间的随机数
    secret_number = random.randint(1, 100)
    attempts = 0
    
    print("欢迎来到猜数字游戏！")
    print("我已经想好了一个1到100之间的数字，你能猜出来吗？")
    
    while True:
        try:
            guess = int(input("请输入你猜的数字: "))
            attempts += 1
            
            if guess < secret_number:
                print("太小了，再试一次！")
            elif guess > secret_number:
                print("太大了，再试一次！")
            else:
                print(f"恭喜你！你猜对了！答案是 {secret_number}。")
                print(f"你一共猜了 {attempts} 次。")
                break
        except ValueError:
            print("请输入一个有效的数字！")

if __name__ == "__main__":
    guess_the_number()