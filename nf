import java.util.Scanner;

public class NextFitMemoryAllocation {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of memory blocks: ");
        int m = sc.nextInt();
        int blockSize[] = new int[m];

        System.out.println("Enter sizes of each memory block:");
        for (int i = 0; i < m; i++) blockSize[i] = sc.nextInt();

        System.out.print("Enter number of processes: ");
        int n = sc.nextInt();
        int processSize[] = new int[n];

        System.out.println("Enter sizes of each process:");
        for (int i = 0; i < n; i++) processSize[i] = sc.nextInt();

        int allocation[] = new int[n];
        for (int i = 0; i < n; i++) allocation[i] = -1;

        // Next Fit Allocation
        int lastIndex = 0; // start searching from here (next-fit)
        for (int i = 0; i < n; i++) {
            int start = lastIndex % m;
            boolean allocated = false;
            for (int k = 0; k < m; k++) {
                int j = (start + k) % m;
                if (blockSize[j] >= processSize[i]) {
                    allocation[i] = j;
                    blockSize[j] -= processSize[i];
                    lastIndex = (j + 1) % m; // next search starts after this block
                    allocated = true;
                    break;
                }
            }
            if (!allocated) {
                allocation[i] = -1; // not allocated
            }
        }

        // Output results
        System.out.println("\nProcess No.\tProcess Size\tBlock No.");
        for (int i = 0; i < n; i++) {
            System.out.print((i + 1) + "\t\t" + processSize[i] + "\t\t");
            if (allocation[i] != -1) System.out.println(allocation[i] + 1);
            else System.out.println("Not Allocated");
        }
        sc.close();
    }
}
