import tkinter as tk
from tkinter import filedialog, messagebox
import pandas as pd

def load_csv():
    file_path = filedialog.askopenfilename(filetypes=[("CSV files", "*.csv")])
    if file_path:
        try:
            df = pd.read_csv(file_path)
            # 保留列名后缀包含“.x”的列
            filtered_columns = [col for col in df.columns if col.endswith('.x')]
            filtered_df = df[filtered_columns]
            
            # 保存处理后的CSV文件
            save_path = filedialog.asksaveasfilename(defaultextension=".csv", filetypes=[("CSV files", "*.csv")])
            if save_path:
                filtered_df.to_csv(save_path, index=False)
                messagebox.showinfo("成功", f"文件已保存到: {save_path}")
        except Exception as e:
            messagebox.showerror("错误", f"读取或处理CSV文件时出错: {e}")

# 创建主窗口
root = tk.Tk()
root.title("CSV列过滤器")

# 创建按钮
load_button = tk.Button(root, text="加载CSV文件并过滤列", command=load_csv)
load_button.pack(pady=20)

# 运行主循环
root.mainloop()